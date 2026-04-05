import 'package:drift/drift.dart';

import 'dreams.dart';
import 'dream_places.dart';

/// Junction table: many-to-many between Dreams and DreamPlaces.
class DreamPlaceLinks extends Table {
  IntColumn get dreamId => integer().references(Dreams, #id)();
  IntColumn get placeId => integer().references(DreamPlaces, #id)();

  /// Whether this was the primary setting of the dream.
  BoolColumn get isPrimary =>
      boolean().withDefault(const Constant(false))();

  TextColumn get appearanceNotes => text().nullable()();

  @override
  Set<Column> get primaryKey => {dreamId, placeId};

  @override
  String get tableName => 'dream_place_links';
}
