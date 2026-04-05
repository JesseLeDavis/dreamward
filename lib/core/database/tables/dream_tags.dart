import 'package:drift/drift.dart';

/// Recurring symbols, themes, or motifs (e.g. "water", "flying", "the old house").
/// These are user-meaningful entities, distinct from the content library's internal tags.
class DreamTags extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 100)();

  /// Hex color code '#RRGGBB' for visual display.
  TextColumn get color => text().withLength(min: 7, max: 7)();

  /// Broad grouping: "symbol", "theme", "emotion", "archetype", "element".
  TextColumn get category => text().nullable()();

  /// User's personal interpretation or meaning notes.
  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'dream_tags';
}
