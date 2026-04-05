import '../../../../core/database/app_database.dart';

abstract class ObeRepository {
  Future<List<ObeLog>> getObeLogs({int limit = 50, int offset = 0});
  Future<int> insertObeLog(ObeLogsCompanion companion);
  Future<void> archiveObeLog(int id);
  Future<void> updateObeLog(ObeLogsCompanion companion);
}
