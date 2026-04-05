import 'package:drift/drift.dart';

import 'dreams.dart';
import 'dream_characters.dart';

/// Junction table: many-to-many between Dreams and DreamCharacters.
class DreamCharacterLinks extends Table {
  IntColumn get dreamId => integer().references(Dreams, #id)();
  IntColumn get characterId =>
      integer().references(DreamCharacters, #id)();

  /// Role this character plays in this specific dream instance.
  TextColumn get roleInDream => text().nullable()();

  TextColumn get appearanceNotes => text().nullable()();

  @override
  Set<Column> get primaryKey => {dreamId, characterId};

  @override
  String get tableName => 'dream_character_links';
}
