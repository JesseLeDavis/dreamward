import 'package:drift/drift.dart';

/// A recurring place entity that can appear across multiple dreams.
/// Linked to specific dreams via DreamPlaceLinks.
class DreamPlaces extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().nullable()();

  /// Broad category: "Home", "School", "Outdoor", "Unknown", "Fantastical".
  TextColumn get category => text().nullable()();

  BoolColumn get isRealWorld =>
      boolean().withDefault(const Constant(false))();

  /// Feeling/atmosphere associated with this place.
  TextColumn get atmosphere => text().nullable()();

  BoolColumn get isArchived =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'dream_places';
}
