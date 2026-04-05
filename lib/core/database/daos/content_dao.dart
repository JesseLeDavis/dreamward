import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/content_items.dart';
import '../tables/content_usage_log.dart';

part 'content_dao.g.dart';

@DriftAccessor(tables: [ContentItems, ContentUsageLog])
class ContentDao extends DatabaseAccessor<AppDatabase> with _$ContentDaoMixin {
  ContentDao(super.db);

  Future<int> insertContentItem(ContentItemsCompanion item) =>
      into(contentItems).insert(item);

  Future<void> updateContentItem(ContentItemsCompanion item) =>
      (update(contentItems)..where((t) => t.id.equals(item.id.value)))
          .write(item);

  Future<void> archiveContentItem(int id) =>
      (update(contentItems)..where((t) => t.id.equals(id)))
          .write(const ContentItemsCompanion(isArchived: Value(true)));

  Future<ContentItem?> getContentItemById(int id) =>
      (select(contentItems)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// Watch all non-archived items of a specific content type.
  /// contentType: 0=technique, 1=affirmation, 2=meditation, 3=visualization, 4=breathwork
  Stream<List<ContentItem>> watchContentByType(int contentType) =>
      (select(contentItems)
            ..where((t) =>
                t.contentType.equals(contentType) & t.isArchived.equals(false))
            ..orderBy([
              (t) => OrderingTerm.asc(t.sortOrder),
              (t) => OrderingTerm.asc(t.title),
            ]))
          .watch();

  Stream<List<ContentItem>> watchFavorites() => (select(contentItems)
        ..where((t) => t.isFavorited.equals(true) & t.isArchived.equals(false))
        ..orderBy([(t) => OrderingTerm.asc(t.title)]))
      .watch();

  Future<void> toggleFavorite(int id) async {
    final item = await getContentItemById(id);
    if (item == null) return;
    await (update(contentItems)..where((t) => t.id.equals(id)))
        .write(ContentItemsCompanion(isFavorited: Value(!item.isFavorited)));
  }

  Future<List<ContentItem>> searchContent(int contentType, String query) =>
      (select(contentItems)
            ..where((t) =>
                t.contentType.equals(contentType) &
                t.isArchived.equals(false) &
                (t.title.like('%$query%') | t.body.like('%$query%')))
            ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
          .get();

  Future<void> logUsage(ContentUsageLogCompanion entry) =>
      into(contentUsageLog).insert(entry);

  Future<List<ContentUsageLogData>> getUsageHistoryForItem(int contentItemId) =>
      (select(contentUsageLog)
            ..where((t) => t.contentItemId.equals(contentItemId))
            ..orderBy([(t) => OrderingTerm.desc(t.usedAt)]))
          .get();
}
