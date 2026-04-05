import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/daily_rundowns.dart';
import 'tables/dreams.dart';
import 'tables/dream_characters.dart';
import 'tables/dream_places.dart';
import 'tables/dream_tags.dart';
import 'tables/dream_character_links.dart';
import 'tables/dream_place_links.dart';
import 'tables/dream_tag_links.dart';
import 'tables/obe_logs.dart';
import 'tables/obe_location_visits.dart';
import 'tables/content_items.dart';
import 'tables/content_usage_log.dart';
import 'tables/app_settings.dart';
import 'daos/daily_rundown_dao.dart';
import 'daos/dream_dao.dart';
import 'daos/dream_entity_dao.dart';
import 'daos/obe_dao.dart';
import 'daos/content_dao.dart';
import 'daos/calendar_dao.dart';
import 'seeds/built_in_content_seeder.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    DailyRundowns,
    Dreams,
    DreamCharacters,
    DreamPlaces,
    DreamTags,
    DreamCharacterLinks,
    DreamPlaceLinks,
    DreamTagLinks,
    ObeLogs,
    ObeLocationVisits,
    ContentItems,
    ContentUsageLog,
    AppSettings,
  ],
  daos: [
    DailyRundownDao,
    DreamDao,
    DreamEntityDao,
    ObeDao,
    ContentDao,
    CalendarDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          // Create performance indexes
          await _createIndexes();
          // Seed built-in content (techniques, affirmations, meditations)
          await BuiltInContentSeeder(this).seed();
        },
        onUpgrade: (m, from, to) async {
          await transaction(() async {
            if (from < 2) {
              await m.database.customStatement(
                  'ALTER TABLE obe_logs ADD COLUMN focus_level INTEGER');
              await m.database.customStatement(
                  'ALTER TABLE obe_logs ADD COLUMN onset_reached INTEGER NOT NULL DEFAULT 0');
              await m.database.customStatement(
                  'ALTER TABLE obe_logs ADD COLUMN onset_intensity INTEGER');
              await m.database.customStatement(
                  'ALTER TABLE obe_logs ADD COLUMN field_type INTEGER');
            }
          });
        },
        beforeOpen: (details) async {
          // Foreign key enforcement must be set on every connection.
          await customStatement('PRAGMA foreign_keys = ON');
          // WAL mode: better read concurrency, faster writes, crash safety.
          await customStatement('PRAGMA journal_mode = WAL');
        },
      );

  Future<void> _createIndexes() async {
    // Dreams
    await customStatement(
        'CREATE INDEX idx_dreams_rundown_date ON dreams(rundown_date)');
    await customStatement(
        'CREATE INDEX idx_dreams_chain_id ON dreams(continuation_chain_id)');
    await customStatement(
        'CREATE INDEX idx_dreams_date_archived ON dreams(rundown_date, is_archived)');
    await customStatement(
        'CREATE INDEX idx_dreams_type ON dreams(dream_type)');

    // OBE logs
    await customStatement(
        'CREATE INDEX idx_obe_logs_rundown_date ON obe_logs(rundown_date)');
    await customStatement(
        'CREATE INDEX idx_obe_logs_session_date ON obe_logs(session_date)');

    // Content
    await customStatement(
        'CREATE INDEX idx_content_items_type ON content_items(content_type, is_archived)');

    // Junction table reverse-lookup indexes
    await customStatement(
        'CREATE INDEX idx_dream_char_links_char ON dream_character_links(character_id)');
    await customStatement(
        'CREATE INDEX idx_dream_place_links_place ON dream_place_links(place_id)');
    await customStatement(
        'CREATE INDEX idx_dream_tag_links_tag ON dream_tag_links(tag_id)');

    // Content usage log
    await customStatement(
        'CREATE INDEX idx_content_usage_item ON content_usage_log(content_item_id)');
    await customStatement(
        'CREATE INDEX idx_content_usage_date ON content_usage_log(used_at)');
  }
}

/// Opens the production database backed by a native SQLite file.
/// Called from the injectable module.
LazyDatabase openAppDatabase() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'dreamward.db'));
    return NativeDatabase.createInBackground(file);
  });
}
