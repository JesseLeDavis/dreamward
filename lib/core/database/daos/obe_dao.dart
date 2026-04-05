import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/obe_logs.dart';
import '../tables/obe_location_visits.dart';

part 'obe_dao.g.dart';

class ObeLogWithDetails {
  final ObeLog log;
  final List<ObeLocationVisit> locationVisits;

  const ObeLogWithDetails({required this.log, required this.locationVisits});
}

@DriftAccessor(tables: [ObeLogs, ObeLocationVisits])
class ObeDao extends DatabaseAccessor<AppDatabase> with _$ObeDaoMixin {
  ObeDao(super.db);

  // --- CRUD ---

  /// Atomically inserts a log and all its location visits.
  Future<int> insertObeLog(
    ObeLogsCompanion log,
    List<ObeLocationVisitsCompanion> locationVisits,
  ) async {
    return transaction(() async {
      final id = await into(obeLogs).insert(log);
      for (final visit in locationVisits) {
        await into(obeLocationVisits)
            .insert(visit.copyWith(obeLogId: Value(id)));
      }
      return id;
    });
  }

  Future<void> updateObeLog(ObeLogsCompanion log) =>
      (update(obeLogs)..where((t) => t.id.equals(log.id.value))).write(log);

  Future<void> archiveObeLog(int id) =>
      (update(obeLogs)..where((t) => t.id.equals(id)))
          .write(const ObeLogsCompanion(isArchived: Value(true)));

  Future<int> deleteObeLog(int id) =>
      (delete(obeLogs)..where((t) => t.id.equals(id))).go();

  // --- Fetch ---

  Future<ObeLogWithDetails?> getObeLogWithDetails(int obeLogId) async {
    final log =
        await (select(obeLogs)..where((t) => t.id.equals(obeLogId)))
            .getSingleOrNull();
    if (log == null) return null;
    final visits = await getLocationVisitsForLog(obeLogId);
    return ObeLogWithDetails(log: log, locationVisits: visits);
  }

  Future<List<ObeLog>> getObeLogsByDate(String rundownDate) =>
      (select(obeLogs)
            ..where((t) =>
                t.rundownDate.equals(rundownDate) &
                t.isArchived.equals(false))
            ..orderBy([(t) => OrderingTerm.desc(t.sessionDate)]))
          .get();

  Future<List<ObeLog>> getObeLogs({
    int limit = 20,
    int offset = 0,
    bool excludeArchived = true,
  }) =>
      (select(obeLogs)
            ..where(
                (t) => excludeArchived ? t.isArchived.equals(false) : const Constant(true))
            ..orderBy([(t) => OrderingTerm.desc(t.sessionDate)])
            ..limit(limit, offset: offset))
          .get();

  Future<List<ObeLog>> getRecentObeLogs(int limit) =>
      (select(obeLogs)
            ..where((t) => t.isArchived.equals(false))
            ..orderBy([(t) => OrderingTerm.desc(t.sessionDate)])
            ..limit(limit))
          .get();

  Future<List<String>> getDatesWithObeLogs(
      String startDate, String endDate) async {
    final result = await (select(obeLogs)
          ..where((t) =>
              t.isArchived.equals(false) &
              t.rundownDate.isBiggerOrEqualValue(startDate) &
              t.rundownDate.isSmallerOrEqualValue(endDate)))
        .get();
    return result
        .map((r) => r.rundownDate)
        .whereType<String>()
        .toSet()
        .toList();
  }

  // --- Location visits ---

  Future<void> addLocationVisit(ObeLocationVisitsCompanion visit) =>
      into(obeLocationVisits).insert(visit);

  Future<void> updateLocationVisit(ObeLocationVisitsCompanion visit) =>
      (update(obeLocationVisits)
            ..where((t) => t.id.equals(visit.id.value)))
          .write(visit);

  Future<int> deleteLocationVisit(int visitId) =>
      (delete(obeLocationVisits)..where((t) => t.id.equals(visitId))).go();

  Future<List<ObeLocationVisit>> getLocationVisitsForLog(int obeLogId) =>
      (select(obeLocationVisits)
            ..where((t) => t.obeLogId.equals(obeLogId))
            ..orderBy([(t) => OrderingTerm.asc(t.sequence)]))
          .get();
}
