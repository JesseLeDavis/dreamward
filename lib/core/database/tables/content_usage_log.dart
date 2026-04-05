import 'package:drift/drift.dart';

import 'content_items.dart';
import 'daily_rundowns.dart';

/// Tracks when the user uses a content item (plays a meditation, reads an affirmation).
/// Feeds "recently used" lists and usage statistics.
class ContentUsageLog extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get contentItemId =>
      integer().references(ContentItems, #id)();

  /// Which daily rundown session this usage belongs to (nullable).
  TextColumn get rundownDate =>
      text().nullable().references(DailyRundowns, #id)();

  BoolColumn get wasCompleted =>
      boolean().withDefault(const Constant(true))();

  /// User's post-use rating 1-5 (nullable).
  IntColumn get userRating => integer().nullable()();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get usedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'content_usage_log';
}
