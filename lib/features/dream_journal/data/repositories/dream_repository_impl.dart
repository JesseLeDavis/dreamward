import '../../../../core/database/app_database.dart';
import 'dream_repository.dart';

class DreamRepositoryImpl implements DreamRepository {
  DreamRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Future<List<Dream>> getDreams({int limit = 50, int offset = 0}) =>
      _db.dreamDao.getDreams(limit: limit, offset: offset);

  @override
  Future<int> insertDream(DreamsCompanion companion) =>
      _db.dreamDao.insertDream(companion);

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
  Future<void> updateDream(DreamsCompanion companion) =>
      _db.dreamDao.updateDream(companion);

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
