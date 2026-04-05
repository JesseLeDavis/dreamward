import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/daily_rundowns.dart';

part 'daily_rundown_dao.g.dart';

@DriftAccessor(tables: [DailyRundowns])
class DailyRundownDao extends DatabaseAccessor<AppDatabase>
    with _$DailyRundownDaoMixin {
  DailyRundownDao(super.db);

  /// Get rundown for a specific date; returns null if none exists.
  Future<DailyRundown?> getRundownByDate(String dateId) =>
      (select(dailyRundowns)..where((t) => t.id.equals(dateId)))
          .getSingleOrNull();

  /// Watch a specific date for reactive UI updates.
  Stream<DailyRundown?> watchRundownByDate(String dateId) =>
      (select(dailyRundowns)..where((t) => t.id.equals(dateId)))
          .watchSingleOrNull();

  /// Upsert (insert or replace) a rundown entry.
  Future<void> upsertRundown(DailyRundownsCompanion entry) =>
      into(dailyRundowns).insertOnConflictUpdate(entry);

  /// Get all rundowns in a date range for the calendar view.
  Future<List<DailyRundown>> getRundownsInRange(
          String startDate, String endDate) =>
      (select(dailyRundowns)
            ..where((t) =>
                t.id.isBiggerOrEqualValue(startDate) &
                t.id.isSmallerOrEqualValue(endDate))
            ..orderBy([(t) => OrderingTerm.desc(t.id)]))
          .get();

  /// Watch rundowns in range (reactive stream for calendar month view).
  Stream<List<DailyRundown>> watchRundownsInRange(
          String startDate, String endDate) =>
      (select(dailyRundowns)
            ..where((t) =>
                t.id.isBiggerOrEqualValue(startDate) &
                t.id.isSmallerOrEqualValue(endDate)))
          .watch();

  /// Cheap query: only date IDs in range (for calendar dot indicators).
  Future<List<String>> getDatesWithRundownsInRange(
      String startDate, String endDate) async {
    final results = await (select(dailyRundowns)
          ..where((t) =>
              t.id.isBiggerOrEqualValue(startDate) &
              t.id.isSmallerOrEqualValue(endDate))
          ..orderBy([(t) => OrderingTerm.asc(t.id)]))
        .get();
    return results.map((r) => r.id).toList();
  }

  Future<void> deleteRundown(String dateId) =>
      (delete(dailyRundowns)..where((t) => t.id.equals(dateId))).go();
}
