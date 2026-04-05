import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

class ExploreCategoryScreen extends StatefulWidget {
  const ExploreCategoryScreen({super.key, required this.slug});

  final String slug;

  @override
  State<ExploreCategoryScreen> createState() => _ExploreCategoryScreenState();
}

class _ExploreCategoryScreenState extends State<ExploreCategoryScreen> {
  late final AppDatabase _db;
  late final Stream<List<ContentItem>> _stream;
  late final String _label;

  @override
  void initState() {
    super.initState();
    _db = GetIt.instance<AppDatabase>();

    if (widget.slug == 'favorites') {
      _stream = _db.contentDao.watchFavorites();
      _label = 'FAVORITES';
    } else {
      final cat = ExploreCategory.fromSlug(widget.slug);
      if (cat != null) {
        _stream = _db.contentDao.watchContentByType(cat.contentType);
        _label = cat.label.toUpperCase();
      } else {
        _stream = const Stream.empty();
        _label = widget.slug.toUpperCase();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      appBar: _CategoryAppBar(label: _label, db: _db),
      body: StreamBuilder<List<ContentItem>>(
        stream: _stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: _TerminalLoader(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'ERROR: ${snapshot.error}',
                style: AppTypography.label,
              ),
            );
          }

          final items = snapshot.data ?? [];

          if (items.isEmpty) {
            return Center(
              child: Text(
                'NO ITEMS IN THIS CATEGORY.',
                style: AppTypography.labelAmber,
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenH,
              vertical: AppSpacing.screenV,
            ),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) => _ContentCard(
              item: items[i],
              onTap: () => context.pushNamed(
                AppRoutes.contentItem,
                pathParameters: {
                  'category': widget.slug,
                  'itemId': items[i].id.toString(),
                },
              ),
              onToggleFavorite: () =>
                  _db.contentDao.toggleFavorite(items[i].id),
            ),
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// App bar
// ---------------------------------------------------------------------------

class _CategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CategoryAppBar({required this.label, required this.db});

  final String label;
  final AppDatabase db;

  @override
  Size get preferredSize => const Size.fromHeight(48 + 1);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(label, style: AppTypography.heading),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: AppColors.borderSubtle),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Content card
// ---------------------------------------------------------------------------

class _ContentCard extends StatelessWidget {
  const _ContentCard({
    required this.item,
    required this.onTap,
    required this.onToggleFavorite,
  });

  final ContentItem item;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;

  String get _difficultyLabel {
    switch (item.difficulty) {
      case 0:
        return 'BEGINNER';
      case 1:
        return 'INTERMEDIATE';
      case 2:
        return 'ADVANCED';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundSurface,
          border: Border.all(color: AppColors.borderNormal),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.cardPad,
                vertical: 10,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.borderSubtle),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      item.title.toUpperCase(),
                      style: AppTypography.label,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: onToggleFavorite,
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        item.isFavorited ? Icons.star : Icons.star_outline,
                        size: 16,
                        color: item.isFavorited
                            ? AppColors.amber
                            : AppColors.textMuted,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(AppSpacing.cardPad),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.excerpt != null && item.excerpt!.isNotEmpty) ...[
                    Text(
                      item.excerpt!,
                      style: AppTypography.bodyMuted,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                  ],

                  // Meta row: difficulty + duration
                  Row(
                    children: [
                      if (_difficultyLabel.isNotEmpty)
                        _MetaTag(label: _difficultyLabel),
                      if (_difficultyLabel.isNotEmpty &&
                          item.estimatedDurationMinutes != null)
                        const SizedBox(width: 6),
                      if (item.estimatedDurationMinutes != null)
                        _MetaTag(
                            label:
                                '${item.estimatedDurationMinutes} MIN'),
                      const Spacer(),
                      const Icon(
                        Icons.chevron_right,
                        size: 14,
                        color: AppColors.textMuted,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Meta tag chip
// ---------------------------------------------------------------------------

class _MetaTag extends StatelessWidget {
  const _MetaTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderStrong),
      ),
      child: Text(label, style: AppTypography.tag),
    );
  }
}

// ---------------------------------------------------------------------------
// Terminal-style loading indicator
// ---------------------------------------------------------------------------

class _TerminalLoader extends StatelessWidget {
  const _TerminalLoader();

  @override
  Widget build(BuildContext context) {
    return Text('LOADING...', style: AppTypography.labelAmber);
  }
}
