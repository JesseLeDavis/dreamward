import 'package:drift/drift.dart';

/// Library of techniques, affirmations, meditations, and visualizations.
/// Includes both built-in seeded content and user-created items.
class ContentItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// ContentType enum index:
  /// 0=obeTechnique, 1=affirmation, 2=meditation, 3=visualization, 4=breathwork
  IntColumn get contentType => integer()();

  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get body => text()();
  TextColumn get excerpt => text().nullable()();

  /// ContentDifficulty enum index: 0=beginner, 1=intermediate, 2=advanced
  IntColumn get difficulty => integer().nullable()();

  IntColumn get estimatedDurationMinutes => integer().nullable()();

  /// True for content shipped with the app. False for user-created content.
  BoolColumn get isBuiltIn =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isFavorited =>
      boolean().withDefault(const Constant(false))();

  /// Context hint for techniques (e.g. "WBTB", "hypnagogic", "any").
  TextColumn get bestPracticeContext => text().nullable()();

  /// Internal comma-separated tags for filtering (e.g. "WILD,body-scan,beginner").
  /// Distinct from user-created DreamTags.
  TextColumn get tagsRaw => text().nullable()();

  TextColumn get sourceAttribution => text().nullable()();

  IntColumn get sortOrder =>
      integer().withDefault(const Constant(0))();

  BoolColumn get isArchived =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'content_items';
}
