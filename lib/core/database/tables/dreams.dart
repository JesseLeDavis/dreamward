import 'package:drift/drift.dart';

import 'daily_rundowns.dart';

/// Core dream journal entry. Supports continuation chains, entity linking,
/// and lucid dreaming specifics.
class Dreams extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// Date the dream was recorded (morning after the dream). FK to DailyRundowns.
  TextColumn get rundownDate =>
      text().nullable().references(DailyRundowns, #id)();

  /// Direct parent in a continuation chain. Self-referential FK.
  IntColumn get continuationOfId =>
      integer().nullable().references(Dreams, #id)();

  /// UUID shared by all dreams in the same continuation chain.
  /// Allows fetching the full chain with a simple WHERE clause — no recursion needed.
  TextColumn get continuationChainId => text().nullable()();

  // --- Core content ---
  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get description => text()(); // full narrative
  TextColumn get summary => text().nullable()(); // 1-2 sentence summary

  // --- Classification (stored as int index of enums) ---
  /// DreamType enum index. 0=normal, 1=lucid, 2=recurring, 3=nightmare,
  /// 4=prophetic, 5=visitation, 6=hypnagogic
  IntColumn get dreamType =>
      integer().withDefault(const Constant(0))();

  /// DreamClarity enum index. 0=fragmentary, 1=partial, 2=clear, 3=vivid, 4=crystalClear
  IntColumn get clarity =>
      integer().withDefault(const Constant(2))();

  /// JSON array of DreamEmotion indexes: "[0,4,6]".
  /// Not indexed — display-only metadata, not a query predicate.
  TextColumn get emotionsJson => text().nullable()();

  // --- Lucid dreaming specifics ---
  BoolColumn get achievedLucidity =>
      boolean().withDefault(const Constant(false))();
  TextColumn get lucidityTrigger => text().nullable()();
  IntColumn get lucidDurationEstimateMinutes => integer().nullable()();

  /// Approximate time of dream within the sleep period, as minutes since midnight.
  IntColumn get estimatedTimeMinutes => integer().nullable()();

  /// User significance rating 1-5.
  IntColumn get significanceRating => integer().nullable()();

  BoolColumn get isPrivate =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'dreams';
}
