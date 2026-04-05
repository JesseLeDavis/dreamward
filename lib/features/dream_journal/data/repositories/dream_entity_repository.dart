import '../../../../core/database/app_database.dart';

abstract class DreamEntityRepository {
  Stream<List<DreamTag>> watchAllTags();
  Future<List<DreamTag>> searchTags(String query);
  Future<DreamTag> findOrCreateTag(String name, String color);

  Stream<List<DreamCharacter>> watchAllCharacters();
  Future<List<DreamCharacter>> searchCharacters(String query);
  Future<int> insertCharacter(DreamCharactersCompanion character);
  Future<void> archiveCharacter(int id);
}
