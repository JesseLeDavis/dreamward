import '../../../../core/database/app_database.dart';
import 'dream_entity_repository.dart';

class DreamEntityRepositoryImpl implements DreamEntityRepository {
  DreamEntityRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Stream<List<DreamTag>> watchAllTags() => _db.dreamEntityDao.watchAllTags();

  @override
  Future<List<DreamTag>> searchTags(String query) =>
      _db.dreamEntityDao.searchTags(query);

  @override
  Future<DreamTag> findOrCreateTag(String name, String color) =>
      _db.dreamEntityDao.findOrCreateTag(name, color);

  @override
  Stream<List<DreamCharacter>> watchAllCharacters() =>
      _db.dreamEntityDao.watchAllCharacters();

  @override
  Future<List<DreamCharacter>> searchCharacters(String query) =>
      _db.dreamEntityDao.searchCharacters(query);

  @override
  Future<int> insertCharacter(DreamCharactersCompanion character) =>
      _db.dreamEntityDao.insertCharacter(character);

  @override
  Future<void> archiveCharacter(int id) =>
      _db.dreamEntityDao.archiveCharacter(id);
}
