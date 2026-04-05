import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/dream_characters.dart';
import '../tables/dream_places.dart';
import '../tables/dream_tags.dart';
import '../tables/dream_character_links.dart';
import '../tables/dream_place_links.dart';
import '../tables/dream_tag_links.dart';

part 'dream_entity_dao.g.dart';

@DriftAccessor(tables: [
  DreamCharacters,
  DreamPlaces,
  DreamTags,
  DreamCharacterLinks,
  DreamPlaceLinks,
  DreamTagLinks,
])
class DreamEntityDao extends DatabaseAccessor<AppDatabase>
    with _$DreamEntityDaoMixin {
  DreamEntityDao(super.db);

  // --- Characters ---

  Future<int> insertCharacter(DreamCharactersCompanion character) =>
      into(dreamCharacters).insert(character);

  Future<void> updateCharacter(DreamCharactersCompanion character) =>
      (update(dreamCharacters)
            ..where((t) => t.id.equals(character.id.value)))
          .write(character);

  Future<void> archiveCharacter(int id) =>
      (update(dreamCharacters)..where((t) => t.id.equals(id)))
          .write(const DreamCharactersCompanion(isArchived: Value(true)));

  Future<DreamCharacter?> getCharacterById(int id) =>
      (select(dreamCharacters)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Stream<List<DreamCharacter>> watchAllCharacters() =>
      (select(dreamCharacters)
            ..where((t) => t.isArchived.equals(false))
            ..orderBy([(t) => OrderingTerm.asc(t.name)]))
          .watch();

  Future<List<DreamCharacter>> searchCharacters(String query) =>
      (select(dreamCharacters)
            ..where((t) =>
                t.isArchived.equals(false) & t.name.like('%$query%'))
            ..orderBy([(t) => OrderingTerm.asc(t.name)]))
          .get();

  // --- Places ---

  Future<int> insertPlace(DreamPlacesCompanion place) =>
      into(dreamPlaces).insert(place);

  Future<void> updatePlace(DreamPlacesCompanion place) =>
      (update(dreamPlaces)..where((t) => t.id.equals(place.id.value)))
          .write(place);

  Future<void> archivePlace(int id) =>
      (update(dreamPlaces)..where((t) => t.id.equals(id)))
          .write(const DreamPlacesCompanion(isArchived: Value(true)));

  Future<DreamPlace?> getPlaceById(int id) =>
      (select(dreamPlaces)..where((t) => t.id.equals(id))).getSingleOrNull();

  Stream<List<DreamPlace>> watchAllPlaces() =>
      (select(dreamPlaces)
            ..where((t) => t.isArchived.equals(false))
            ..orderBy([(t) => OrderingTerm.asc(t.name)]))
          .watch();

  Future<List<DreamPlace>> searchPlaces(String query) =>
      (select(dreamPlaces)
            ..where(
                (t) => t.isArchived.equals(false) & t.name.like('%$query%'))
            ..orderBy([(t) => OrderingTerm.asc(t.name)]))
          .get();

  // --- Tags ---

  Future<int> insertTag(DreamTagsCompanion tag) =>
      into(dreamTags).insert(tag);

  Future<void> updateTag(DreamTagsCompanion tag) =>
      (update(dreamTags)..where((t) => t.id.equals(tag.id.value)))
          .write(tag);

  Future<int> deleteTag(int id) =>
      (delete(dreamTags)..where((t) => t.id.equals(id))).go();

  Future<DreamTag?> getTagById(int id) =>
      (select(dreamTags)..where((t) => t.id.equals(id))).getSingleOrNull();

  Stream<List<DreamTag>> watchAllTags() =>
      (select(dreamTags)..orderBy([(t) => OrderingTerm.asc(t.name)])).watch();

  Future<List<DreamTag>> searchTags(String query) =>
      (select(dreamTags)..where((t) => t.name.like('%$query%'))).get();

  /// Find existing tag by name or create a new one.
  Future<DreamTag> findOrCreateTag(String name, String color) async {
    final existing = await (select(dreamTags)
          ..where((t) => t.name.equals(name))
          ..limit(1))
        .getSingleOrNull();
    if (existing != null) return existing;

    final id = await insertTag(
        DreamTagsCompanion.insert(name: name, color: color));
    return (await getTagById(id))!;
  }
}
