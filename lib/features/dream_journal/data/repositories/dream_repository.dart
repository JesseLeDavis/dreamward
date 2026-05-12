import '../../../../core/database/app_database.dart';

abstract class DreamRepository {
  Future<List<Dream>> getDreams({int limit = 50, int offset = 0, String? searchQuery});
  Future<int> insertDream(DreamsCompanion companion);
  Future<void> archiveDream(int id);
  Future<void> setTagsForDream(int dreamId, List<int> tagIds);
  Future<void> addCharacterToDream(int dreamId, int characterId);
  Future<List<Dream>> getDreamsByTags(List<int> tagIds);
  Future<List<Dream>> getDreamsByCharacters(List<int> characterIds);
  Future<void> updateDream(DreamsCompanion companion);
  Future<void> setCharactersForDream(int dreamId, List<int> characterIds);
}
