import 'package:drift/drift.dart';

/// Simple key-value store for user preferences.
/// Keys: 'theme_mode', 'daily_reminder_enabled', 'daily_reminder_hour',
///       'daily_reminder_minute', 'dream_reminder_enabled', 'dream_reminder_hour',
///       'dream_reminder_minute', 'onboarding_complete', 'last_seen_version'.
class AppSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};

  @override
  String get tableName => 'app_settings';
}
