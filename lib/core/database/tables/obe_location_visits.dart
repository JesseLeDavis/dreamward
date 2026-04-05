import 'package:drift/drift.dart';

import 'obe_logs.dart';

/// Child table of ObeLogs. OBE sessions may involve visiting multiple
/// distinct locations sequentially.
class ObeLocationVisits extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get obeLogId => integer().references(ObeLogs, #id)();

  /// Order of visit within the session (1-indexed).
  IntColumn get sequence => integer().withDefault(const Constant(1))();

  TextColumn get locationName => text().nullable()();
  TextColumn get description => text()();

  BoolColumn get isRealWorldLocation =>
      boolean().withDefault(const Constant(false))();

  /// Real-world reference (e.g. "my childhood home", "a street in Paris").
  TextColumn get realWorldRef => text().nullable()();

  IntColumn get durationMinutes => integer().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'obe_location_visits';
}
