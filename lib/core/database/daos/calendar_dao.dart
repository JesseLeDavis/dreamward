import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/daily_rundowns.dart';
import '../tables/dreams.dart';
import '../tables/obe_logs.dart';

part 'calendar_dao.g.dart';

/// Lightweight summary of a single calendar day (for rendering month grid).
class CalendarDaySummary {
  final String dateId;
  final bool hasRundown;
  final int dreamCount;
  final int obeCount;
  final int? eveningMood; // raw int index into MoodLevel enum

  const CalendarDaySummary({
    required this.dateId,
    required this.hasRundown,
    required this.dreamCount,
    required this.obeCount,
    this.eveningMood,
  });
}

@DriftAccessor(tables: [DailyRundowns, Dreams, ObeLogs])
class CalendarDao extends DatabaseAccessor<AppDatabase>
    with _$CalendarDaoMixin {
  CalendarDao(super.db);

  /// Returns a summary for every date that has any activity in the given range.
  /// Used to render month-view dot indicators.
  Future<List<CalendarDaySummary>> getMonthSummary(
      String startDate, String endDate) async {
    // Collect all active dates from each source.
    final rundownRows = await (select(dailyRundowns)
          ..where((t) =>
              t.id.isBiggerOrEqualValue(startDate) &
              t.id.isSmallerOrEqualValue(endDate)))
        .get();

    final dreamRows = await (select(dreams)
          ..where((t) =>
              t.isArchived.equals(false) &
              t.rundownDate.isBiggerOrEqualValue(startDate) &
              t.rundownDate.isSmallerOrEqualValue(endDate)))
        .get();

    final obeRows = await (select(obeLogs)
          ..where((t) =>
              t.isArchived.equals(false) &
              t.rundownDate.isBiggerOrEqualValue(startDate) &
              t.rundownDate.isSmallerOrEqualValue(endDate)))
        .get();

    // Aggregate into a map keyed by date string.
    final Map<String, CalendarDaySummary> summaryMap = {};

    for (final r in rundownRows) {
      summaryMap[r.id] = CalendarDaySummary(
        dateId: r.id,
        hasRundown: true,
        dreamCount: 0,
        obeCount: 0,
        eveningMood: r.eveningMood,
      );
    }

    for (final d in dreamRows) {
      if (d.rundownDate == null) continue;
      final date = d.rundownDate!;
      final existing = summaryMap[date];
      summaryMap[date] = CalendarDaySummary(
        dateId: date,
        hasRundown: existing?.hasRundown ?? false,
        dreamCount: (existing?.dreamCount ?? 0) + 1,
        obeCount: existing?.obeCount ?? 0,
        eveningMood: existing?.eveningMood,
      );
    }

    for (final o in obeRows) {
      if (o.rundownDate == null) continue;
      final date = o.rundownDate!;
      final existing = summaryMap[date];
      summaryMap[date] = CalendarDaySummary(
        dateId: date,
        hasRundown: existing?.hasRundown ?? false,
        dreamCount: existing?.dreamCount ?? 0,
        obeCount: (existing?.obeCount ?? 0) + 1,
        eveningMood: existing?.eveningMood,
      );
    }

    return summaryMap.values.toList()
      ..sort((a, b) => a.dateId.compareTo(b.dateId));
  }

  /// Watch the month summary reactively.
  Stream<List<CalendarDaySummary>> watchMonthSummary(
      String startDate, String endDate) {
    // Combine streams from all three tables; rebuild summary on any change.
    // Simple approach: watch the dreams table (most frequent changes) and
    // rebuild the full summary. For production, consider rxdart CombineLatest.
    return (select(dreams)
              ..where((t) =>
                  t.rundownDate.isBiggerOrEqualValue(startDate) &
                  t.rundownDate.isSmallerOrEqualValue(endDate)))
        .watch()
        .asyncMap((_) => getMonthSummary(startDate, endDate));
  }
}
