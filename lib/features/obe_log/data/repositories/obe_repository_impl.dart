import '../../../../core/database/app_database.dart';
import 'obe_repository.dart';

class ObeRepositoryImpl implements ObeRepository {
  ObeRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Future<List<ObeLog>> getObeLogs({int limit = 50, int offset = 0}) =>
      _db.obeDao.getObeLogs(limit: limit, offset: offset);

  @override
  Future<int> insertObeLog(ObeLogsCompanion companion) =>
      _db.obeDao.insertObeLog(companion, []);

  @override
  Future<void> archiveObeLog(int id) => _db.obeDao.archiveObeLog(id);

  @override
  Future<void> updateObeLog(ObeLogsCompanion companion) =>
      _db.obeDao.updateObeLog(companion);
}
