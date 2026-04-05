import 'package:drift/drift.dart';

import 'dreams.dart';
import 'dream_tags.dart';

/// Junction table: many-to-many between Dreams and DreamTags.
class DreamTagLinks extends Table {
  IntColumn get dreamId => integer().references(Dreams, #id)();
  IntColumn get tagId => integer().references(DreamTags, #id)();

  @override
  Set<Column> get primaryKey => {dreamId, tagId};

  @override
  String get tableName => 'dream_tag_links';
}
