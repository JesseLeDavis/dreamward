import '../../../../core/database/app_database.dart';

abstract class DreamRepository {
  Future<List<Dream>> getDreams({int limit = 50, int offset = 0});
  Future<int> insertDream(DreamsCompanion companion);
  Future<void> archiveDream(int id);
  Future<void> setTagsForDream(int dreamId, List<int> tagIds);
  Future<void> addCharacterToDream(int dreamId, int characterId);
  Future<List<Dream>> getDreamsByTag(int tagId);
  Future<List<Dream>> getDreamsByCharacter(int characterId);
  Future<void> updateDream(DreamsCompanion companion);
  Future<void> setCharactersForDream(int dreamId, List<int> characterIds);
}
