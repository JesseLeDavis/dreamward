import '../../../../core/database/app_database.dart';
import 'obe_repository.dart';

class ObeRepositoryImpl implements ObeRepository {
  ObeRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Future<List<ObeLog>> getObeLogs({int limit = 50, int offset = 0}) =>
      _db.obeDao.getObeLogs(limit: limit, offset: offset);

  @override
  Future<int> insertObeLog(ObeLogsCompanion companion) async {
    final date = companion.rundownDate;
    if (date.present && date.value != null) {
      await _ensureRundownExists(date.value!);
    }
    return _db.obeDao.insertObeLog(companion, []);
  }

  @override
  Future<void> archiveObeLog(int id) => _db.obeDao.archiveObeLog(id);

  @override
  Future<void> updateObeLog(ObeLogsCompanion companion) async {
    final date = companion.rundownDate;
    if (date.present && date.value != null) {
      await _ensureRundownExists(date.value!);
    }
    await _db.obeDao.updateObeLog(companion);
  }

  Future<void> _ensureRundownExists(String dateId) async {
    final existing = await _db.dailyRundownDao.getRundownByDate(dateId);
    if (existing == null) {
      await _db.dailyRundownDao
          .upsertRundown(DailyRundownsCompanion.insert(id: dateId));
    }
  }
}
