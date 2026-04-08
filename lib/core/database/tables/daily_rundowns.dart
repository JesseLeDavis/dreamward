import 'package:drift/drift.dart';

/// One entry per calendar day. The date string 'YYYY-MM-DD' is the primary key,
/// enforcing uniqueness at the database level and enabling efficient range queries.
class DailyRundowns extends Table {
  /// Date in ISO 8601 format: 'YYYY-MM-DD'. Acts as both PK and natural join key.
  TextColumn get id => text().withLength(min: 10, max: 10)();

  // --- Mood & Energy (stored as integers, mapped via TypeConverter) ---
  IntColumn get morningMood => integer().nullable()();
  IntColumn get eveningMood => integer().nullable()();
  IntColumn get morningEnergy => integer().nullable()();
  IntColumn get eveningEnergy => integer().nullable()();
  IntColumn get sleepQuality => integer().nullable()();

  /// Sleep duration in minutes for integer precision.
  IntColumn get sleepDurationMinutes => integer().nullable()();

  // --- Structured prompts (free text) ---
  TextColumn get highlights => text().nullable()();
  TextColumn get challenges => text().nullable()();
  TextColumn get gratitude => text().nullable()();
  TextColumn get intentions => text().nullable()(); // for tomorrow
  TextColumn get reflections => text().nullable()();
  TextColumn get affirmationOfDay => text().nullable()();
  TextColumn get bodyAwareness => text().nullable()();

  // --- Pre-sleep routine tracking ---
  BoolColumn get didMeditate =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get didVisualize =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get didBodyScan =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get didAffirmations =>
      boolean().withDefault(const Constant(false))();

  // --- Pre-transmission protocol ritual ---
  BoolColumn get ritualClear =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get ritualTone =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get ritualField =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get ritualAffirmation =>
      boolean().withDefault(const Constant(false))();

  // --- Sleep intention (for lucid/OBE targeting) ---
  TextColumn get sleepIntention => text().nullable()();
  IntColumn get bedtimeHour => integer().nullable()(); // 0-23
  IntColumn get bedtimeMinute => integer().nullable()(); // 0-59

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'daily_rundowns';

  @override
  Set<Column> get primaryKey => {id};
}
