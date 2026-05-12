import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/dreams.dart';
import '../tables/dream_characters.dart';
import '../tables/dream_places.dart';
import '../tables/dream_tags.dart';
import '../tables/dream_character_links.dart';
import '../tables/dream_place_links.dart';
import '../tables/dream_tag_links.dart';

part 'dream_dao.g.dart';

/// Supporting data class for a dream with all associated entities.
class DreamWithEntities {
  final Dream dream;
  final List<DreamCharacter> characters;
  final List<DreamPlace> places;
  final List<DreamTag> tags;

  const DreamWithEntities({
    required this.dream,
    required this.characters,
    required this.places,
    required this.tags,
  });
}

@DriftAccessor(tables: [
  Dreams,
  DreamCharacters,
  DreamPlaces,
  DreamTags,
  DreamCharacterLinks,
  DreamPlaceLinks,
  DreamTagLinks,
])
class DreamDao extends DatabaseAccessor<AppDatabase> with _$DreamDaoMixin {
  DreamDao(super.db);

  // --- CRUD ---

  Future<int> insertDream(DreamsCompanion dream) =>
      into(dreams).insert(dream);

  Future<void> updateDream(DreamsCompanion dream) =>
      (update(dreams)..where((t) => t.id.equals(dream.id.value)))
          .write(dream);

  Future<void> archiveDream(int id) =>
      (update(dreams)..where((t) => t.id.equals(id)))
          .write(const DreamsCompanion(isArchived: Value(true)));

  Future<int> deleteDream(int id) =>
      (delete(dreams)..where((t) => t.id.equals(id))).go();

  // --- Single fetch ---

  Future<Dream?> getDreamById(int id) =>
      (select(dreams)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<DreamWithEntities?> getDreamWithEntities(int dreamId) async {
    final dream = await getDreamById(dreamId);
    if (dream == null) return null;

    final chars = await _getCharactersForDream(dreamId);
    final places = await _getPlacesForDream(dreamId);
    final tags = await _getTagsForDream(dreamId);

    return DreamWithEntities(
        dream: dream, characters: chars, places: places, tags: tags);
  }

  Stream<DreamWithEntities?> watchDreamWithEntities(int dreamId) {
    // Returns a stream that emits whenever dreams or any linked entities change.
    // For full reactivity, merge streams from all four tables.
    return (select(dreams)..where((t) => t.id.equals(dreamId)))
        .watchSingleOrNull()
        .asyncMap((dream) async {
      if (dream == null) return null;
      final chars = await _getCharactersForDream(dreamId);
      final places = await _getPlacesForDream(dreamId);
      final tags = await _getTagsForDream(dreamId);
      return DreamWithEntities(
          dream: dream, characters: chars, places: places, tags: tags);
    });
  }

  // --- List queries ---

  Future<List<Dream>> getDreamsByDate(String rundownDate) =>
      (select(dreams)
            ..where((t) =>
                t.rundownDate.equals(rundownDate) &
                t.isArchived.equals(false))
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .get();

  Stream<List<Dream>> watchDreamsByDate(String rundownDate) =>
      (select(dreams)
            ..where((t) =>
                t.rundownDate.equals(rundownDate) &
                t.isArchived.equals(false))
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .watch();

  Future<List<Dream>> getRecentDreams(int limit) =>
      (select(dreams)
            ..where((t) => t.isArchived.equals(false))
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
            ..limit(limit))
          .get();

  Future<List<Dream>> getDreams({
    int limit = 20,
    int offset = 0,
    bool excludeArchived = true,
    String? searchQuery,
  }) {
    return (select(dreams)
          ..where((t) {
            Expression<bool> cond =
                excludeArchived ? t.isArchived.equals(false) : const Constant(true);
            if (searchQuery != null && searchQuery.isNotEmpty) {
              cond = cond &
                  (t.title.like('%$searchQuery%') |
                      t.description.like('%$searchQuery%'));
            }
            return cond;
          })
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(limit, offset: offset))
        .get();
  }

  // --- Continuation chains ---

  Future<List<Dream>> getDreamsInChain(String chainId) =>
      (select(dreams)
            ..where((t) => t.continuationChainId.equals(chainId))
            ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
          .get();

  Future<void> linkAsContinuation({
    required int continuingDreamId,
    required int continuedFromId,
  }) async {
    await transaction(() async {
      final parent = await getDreamById(continuedFromId);
      if (parent == null) return;

      // Use existing chain ID or generate a new one via UUID (caller provides).
      final chainId = parent.continuationChainId ??
          'chain-$continuedFromId-$continuingDreamId';

      // Update parent to have chain ID if it doesn't already.
      if (parent.continuationChainId == null) {
        await updateDream(DreamsCompanion(
          id: Value(continuedFromId),
          continuationChainId: Value(chainId),
        ));
      }

      // Update the continuing dream.
      await updateDream(DreamsCompanion(
        id: Value(continuingDreamId),
        continuationOfId: Value(continuedFromId),
        continuationChainId: Value(chainId),
      ));
    });
  }

  // --- Entity links ---

  Future<void> addCharacterToDream(int dreamId, int characterId,
      {String? roleInDream}) =>
      into(dreamCharacterLinks).insertOnConflictUpdate(
        DreamCharacterLinksCompanion.insert(
          dreamId: dreamId,
          characterId: characterId,
          roleInDream: Value(roleInDream),
        ),
      );

  Future<int> removeCharacterFromDream(int dreamId, int characterId) =>
      (delete(dreamCharacterLinks)
            ..where((t) =>
                t.dreamId.equals(dreamId) & t.characterId.equals(characterId)))
          .go();

  Future<void> addPlaceToDream(int dreamId, int placeId,
      {bool isPrimary = false}) =>
      into(dreamPlaceLinks).insertOnConflictUpdate(
        DreamPlaceLinksCompanion.insert(
          dreamId: dreamId,
          placeId: placeId,
          isPrimary: Value(isPrimary),
        ),
      );

  Future<int> removePlaceFromDream(int dreamId, int placeId) =>
      (delete(dreamPlaceLinks)
            ..where(
                (t) => t.dreamId.equals(dreamId) & t.placeId.equals(placeId)))
          .go();

  Future<void> addTagToDream(int dreamId, int tagId) =>
      into(dreamTagLinks).insertOnConflictUpdate(
        DreamTagLinksCompanion.insert(dreamId: dreamId, tagId: tagId),
      );

  Future<int> removeTagFromDream(int dreamId, int tagId) =>
      (delete(dreamTagLinks)
            ..where(
                (t) => t.dreamId.equals(dreamId) & t.tagId.equals(tagId)))
          .go();

  Future<void> setTagsForDream(int dreamId, List<int> tagIds) async {
    await transaction(() async {
      await (delete(dreamTagLinks)
            ..where((t) => t.dreamId.equals(dreamId)))
          .go();
      for (final tagId in tagIds) {
        await addTagToDream(dreamId, tagId);
      }
    });
  }

  // --- Filter by entity ---

  /// Returns dreams that have AT LEAST ONE of [tagIds] linked.
  /// Empty list short-circuits to an empty result.
  Future<List<Dream>> getDreamsByTags(List<int> tagIds) async {
    if (tagIds.isEmpty) return const [];
    final query = select(dreams).join([
      innerJoin(dreamTagLinks, dreamTagLinks.dreamId.equalsExp(dreams.id)),
    ])
      ..where(dreamTagLinks.tagId.isIn(tagIds) &
          dreams.isArchived.equals(false))
      ..groupBy([dreams.id])
      ..orderBy([OrderingTerm.desc(dreams.createdAt)]);
    final rows = await query.get();
    return rows.map((r) => r.readTable(dreams)).toList();
  }

  /// Returns dreams that have AT LEAST ONE of [characterIds] linked.
  Future<List<Dream>> getDreamsByCharacters(List<int> characterIds) async {
    if (characterIds.isEmpty) return const [];
    final query = select(dreams).join([
      innerJoin(dreamCharacterLinks,
          dreamCharacterLinks.dreamId.equalsExp(dreams.id)),
    ])
      ..where(dreamCharacterLinks.characterId.isIn(characterIds) &
          dreams.isArchived.equals(false))
      ..groupBy([dreams.id])
      ..orderBy([OrderingTerm.desc(dreams.createdAt)]);
    final rows = await query.get();
    return rows.map((r) => r.readTable(dreams)).toList();
  }

  // --- Search ---

  Future<List<Dream>> searchDreams(String query) =>
      (select(dreams)
            ..where((t) =>
                t.isArchived.equals(false) &
                (t.title.like('%$query%') | t.description.like('%$query%')))
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .get();

  // --- Private helpers ---

  Future<List<DreamCharacter>> _getCharactersForDream(int dreamId) async {
    final query = select(dreamCharacterLinks).join([
      innerJoin(dreamCharacters,
          dreamCharacters.id.equalsExp(dreamCharacterLinks.characterId)),
    ])
      ..where(dreamCharacterLinks.dreamId.equals(dreamId));
    final rows = await query.get();
    return rows.map((r) => r.readTable(dreamCharacters)).toList();
  }

  Future<List<DreamPlace>> _getPlacesForDream(int dreamId) async {
    final query = select(dreamPlaceLinks).join([
      innerJoin(dreamPlaces,
          dreamPlaces.id.equalsExp(dreamPlaceLinks.placeId)),
    ])
      ..where(dreamPlaceLinks.dreamId.equals(dreamId));
    final rows = await query.get();
    return rows.map((r) => r.readTable(dreamPlaces)).toList();
  }

  Future<List<DreamTag>> _getTagsForDream(int dreamId) async {
    final query = select(dreamTagLinks).join([
      innerJoin(dreamTags, dreamTags.id.equalsExp(dreamTagLinks.tagId)),
    ])
      ..where(dreamTagLinks.dreamId.equals(dreamId));
    final rows = await query.get();
    return rows.map((r) => r.readTable(dreamTags)).toList();
  }

  Future<List<String>> getDatesWithDreams(
      String startDate, String endDate) async {
    final result = await (select(dreams)
          ..where((t) =>
              t.isArchived.equals(false) &
              t.rundownDate.isBiggerOrEqualValue(startDate) &
              t.rundownDate.isSmallerOrEqualValue(endDate)))
        .get();
    return result
        .map((r) => r.rundownDate)
        .whereType<String>()
        .toSet()
        .toList();
  }
}
