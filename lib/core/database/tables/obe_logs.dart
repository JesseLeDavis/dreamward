import 'package:drift/drift.dart';

import 'daily_rundowns.dart';
import 'content_items.dart';

/// Out-of-body experience session log.
class ObeLogs extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get rundownDate =>
      text().nullable().references(DailyRundowns, #id)();

  /// FK to the library technique used (nullable — user may not reference the library).
  IntColumn get techniqueContentId =>
      integer().nullable().references(ContentItems, #id)();

  /// Free-text technique name when not using a library item.
  TextColumn get techniqueNameOverride => text().nullable()();

  /// ObeEntryState enum index: 0=attempted, 1=partial, 2=full separation.
  IntColumn get entryState =>
      integer().withDefault(const Constant(0))();

  DateTimeColumn get sessionDate => dateTime()();
  IntColumn get durationMinutes => integer().nullable()();

  // --- Pre-session context ---
  IntColumn get preMoodLevel => integer().nullable()();
  IntColumn get preEnergyLevel => integer().nullable()();
  TextColumn get intention => text().nullable()();

  // --- The experience ---
  TextColumn get description => text()();

  /// JSON array of sensation strings: ["vibrations","paralysis","floating"]
  TextColumn get sensationsJson => text().nullable()();

  BoolColumn get hadVisuals =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get hadAudio =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get hadTactile =>
      boolean().withDefault(const Constant(false))();

  TextColumn get experienceNarrative => text().nullable()();
  TextColumn get primaryLocationDescription => text().nullable()();
  TextColumn get challenges => text().nullable()();
  TextColumn get returnMethod => text().nullable()();

  // --- Phase / onset / field ---

  /// Focus level (Phase depth): 0=PHASE I, 1=PHASE II, 2=PHASE III, 3=PHASE IV (nullable = not recorded)
  IntColumn get focusLevel => integer().nullable()();

  /// Whether vibrational onset was reached.
  BoolColumn get onsetReached =>
      boolean().withDefault(const Constant(false))();

  /// Onset intensity when reached: 1=TRACE, 2=STRONG, 3=SURGE (nullable = not recorded)
  IntColumn get onsetIntensity => integer().nullable()();

  /// Field type: 0=LOCAL, 1=EXPANDED, 2=PARALLEL (nullable = not recorded)
  IntColumn get fieldType => integer().nullable()();

  // --- Post-session ---
  IntColumn get postMoodLevel => integer().nullable()();
  TextColumn get postReflection => text().nullable()();

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
  String get tableName => 'obe_logs';
}
