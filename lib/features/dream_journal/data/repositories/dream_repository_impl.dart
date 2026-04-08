import '../../../../core/database/app_database.dart';
import 'dream_repository.dart';

class DreamRepositoryImpl implements DreamRepository {
  DreamRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Future<List<Dream>> getDreams({int limit = 50, int offset = 0, String? searchQuery}) =>
      _db.dreamDao.getDreams(limit: limit, offset: offset, searchQuery: searchQuery);

  @override
  Future<int> insertDream(DreamsCompanion companion) async {
    final date = companion.rundownDate;
    if (date.present && date.value != null) {
      await _ensureRundownExists(date.value!);
    }
    return _db.dreamDao.insertDream(companion);
  }

  Future<void> _ensureRundownExists(String dateId) async {
    final existing = await _db.dailyRundownDao.getRundownByDate(dateId);
    if (existing == null) {
      await _db.dailyRundownDao
          .upsertRundown(DailyRundownsCompanion.insert(id: dateId));
    }
  }

  @override
  Future<void> archiveDream(int id) => _db.dreamDao.archiveDream(id);

  @override
  Future<void> setTagsForDream(int dreamId, List<int> tagIds) =>
      _db.dreamDao.setTagsForDream(dreamId, tagIds);

  @override
  Future<void> addCharacterToDream(int dreamId, int characterId) =>
      _db.dreamDao.addCharacterToDream(dreamId, characterId);

  @override
  Future<List<Dream>> getDreamsByTag(int tagId) =>
      _db.dreamDao.getDreamsByTag(tagId);

  @override
  Future<List<Dream>> getDreamsByCharacter(int characterId) =>
      _db.dreamDao.getDreamsByCharacter(characterId);

  @override
  Future<void> updateDream(DreamsCompanion companion) async {
    final date = companion.rundownDate;
    if (date.present && date.value != null) {
      await _ensureRundownExists(date.value!);
    }
    await _db.dreamDao.updateDream(companion);
  }

  @override
  Future<void> setCharactersForDream(int dreamId, List<int> characterIds) async {
    // Remove existing character links for this dream
    final existing = await _db.dreamDao.getDreamWithEntities(dreamId);
    if (existing != null) {
      for (final c in existing.characters) {
        await _db.dreamDao.removeCharacterFromDream(dreamId, c.id);
      }
    }
    for (final charId in characterIds) {
      await _db.dreamDao.addCharacterToDream(dreamId, charId);
    }
  }
}
