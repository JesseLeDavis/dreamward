import 'package:drift/drift.dart';

/// A recurring character entity that can appear across multiple dreams.
/// Linked to specific dreams via DreamCharacterLinks.
class DreamCharacters extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().nullable()();
  BoolColumn get isRealPerson =>
      boolean().withDefault(const Constant(false))();

  /// Jungian or other archetypal role tag (e.g. "Mentor", "Shadow", "Trickster").
  TextColumn get archetypeTag => text().nullable()();

  /// Local file path to an avatar/photo.
  TextColumn get avatarPath => text().nullable()();

  BoolColumn get isArchived =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'dream_characters';
}
