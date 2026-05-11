import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/neu_surface.dart';
import '../../../../core/widgets/terminal_glyph.dart';
import '../bloc/content_bloc.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoritesCubit>(
      create: (_) => FavoritesCubit(GetIt.instance<AppDatabase>()),
      child: Scaffold(
        backgroundColor: AppColors.backgroundBase,
        appBar: _ExploreAppBar(),
        body: const _CategoryGrid(),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// App bar
// ---------------------------------------------------------------------------

class _ExploreAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(48 + 1);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('EXPLORE', style: AppTypography.heading),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: AppColors.borderSubtle),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Category grid
// ---------------------------------------------------------------------------

class _CategoryGrid extends StatefulWidget {
  const _CategoryGrid();

  @override
  State<_CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<_CategoryGrid> {
  final Map<int, int> _counts = {};
  final List<StreamSubscription<dynamic>> _subs = [];

  @override
  void initState() {
    super.initState();
    final db = GetIt.instance<AppDatabase>();
    for (final cat in ExploreCategory.values) {
      final sub = db.contentDao.watchContentByType(cat.contentType).listen(
        (items) {
          if (mounted) {
            setState(() => _counts[cat.contentType] = items.length);
          }
        },
      );
      _subs.add(sub);
    }
  }

  @override
  void dispose() {
    for (final sub in _subs) {
      sub.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenH,
        vertical: AppSpacing.screenV,
      ),
      children: [
        // Favorites shortcut
        const _FavoritesRow(),
        const SizedBox(height: AppSpacing.sectionGap),

        // Section label
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text('CATEGORIES', style: AppTypography.label),
        ),

        // 2-column grid
        for (int i = 0; i < _staticCategories.length; i += 2) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _CategoryTile(
                  category: _staticCategories[i],
                  count: _counts[_staticCategories[i].contentType] ?? 0,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: i + 1 < _staticCategories.length
                    ? _CategoryTile(
                        category: _staticCategories[i + 1],
                        count:
                            _counts[_staticCategories[i + 1].contentType] ?? 0,
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Favorites row
// ---------------------------------------------------------------------------

class _FavoritesRow extends StatelessWidget {
  const _FavoritesRow();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final count =
            state is FavoritesLoaded ? state.items.length : 0;
        final label = count == 1 ? '1 SAVED' : '$count SAVED';

        return GestureDetector(
          onTap: () => context.pushNamed(
            AppRoutes.exploreCategory,
            pathParameters: {'category': 'favorites'},
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.cardPad,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: AppColors.amberMuted,
              border: Border.all(color: AppColors.amber.withAlpha(120)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const TerminalGlyph(Glyphs.starFilled,
                    size: 14, color: AppColors.amber),
                const SizedBox(width: 8),
                Text('FAVORITES', style: AppTypography.labelAmber),
                const Spacer(),
                Text(label, style: AppTypography.timestamp),
                const SizedBox(width: 4),
                const TerminalGlyph(
                  Glyphs.chevronRight,
                  size: 14,
                  color: AppColors.amber,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Category tile
// ---------------------------------------------------------------------------

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({required this.category, required this.count});

  final _StaticCategory category;
  final int count;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        AppRoutes.exploreCategory,
        pathParameters: {'category': category.slug},
      ),
      child: NeuRaised(
        radius: 14,
        padding: const EdgeInsets.all(AppSpacing.cardPad),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 88),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TerminalGlyph(category.glyph,
                      size: 16, color: AppColors.textSecondary),
                  const Spacer(),
                  Text(
                    '$count',
                    style: AppTypography.timestamp,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                category.label.toUpperCase(),
                style: AppTypography.label,
              ),
              const SizedBox(height: 2),
              Text(category.sublabel, style: AppTypography.hint),
              const SizedBox(height: AppSpacing.md),
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Container(
                  height: 3,
                  color: AppColors.borderStrong,
                  child: count > 0
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: FractionallySizedBox(
                            widthFactor: (count / 10).clamp(0.05, 1.0),
                            child: Container(color: AppColors.amber),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Static category metadata (slug/label/sublabel/icon — counts come from DB)
// ---------------------------------------------------------------------------

class _StaticCategory {
  const _StaticCategory({
    required this.slug,
    required this.label,
    required this.sublabel,
    required this.glyph,
    required this.contentType,
  });

  final String slug;
  final String label;
  final String sublabel;
  final String glyph;
  final int contentType;
}

const _staticCategories = [
  _StaticCategory(
    slug: 'techniques',
    label: 'OBE Techniques',
    sublabel: 'Induction methods',
    glyph: Glyphs.techniques,
    contentType: 0,
  ),
  _StaticCategory(
    slug: 'affirmations',
    label: 'Affirmations',
    sublabel: 'Daily statements',
    glyph: Glyphs.quote,
    contentType: 1,
  ),
  _StaticCategory(
    slug: 'meditations',
    label: 'Meditations',
    sublabel: 'Guided sessions',
    glyph: Glyphs.meditate,
    contentType: 2,
  ),
  _StaticCategory(
    slug: 'visualizations',
    label: 'Visualizations',
    sublabel: 'Scene building',
    glyph: Glyphs.visualize,
    contentType: 3,
  ),
  _StaticCategory(
    slug: 'breathwork',
    label: 'Breathwork',
    sublabel: 'Breathing exercises',
    glyph: Glyphs.breath,
    contentType: 4,
  ),
];
