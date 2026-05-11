import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/terminal_glyph.dart';

class ContentItemDetailScreen extends StatefulWidget {
  const ContentItemDetailScreen({super.key, required this.itemId});

  final int itemId;

  @override
  State<ContentItemDetailScreen> createState() =>
      _ContentItemDetailScreenState();
}

class _ContentItemDetailScreenState extends State<ContentItemDetailScreen> {
  late final AppDatabase _db;
  ContentItem? _item;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _db = GetIt.instance<AppDatabase>();
    _load();
  }

  Future<void> _load() async {
    try {
      final item = await _db.contentDao.getContentItemById(widget.itemId);
      if (mounted) {
        setState(() {
          _item = item;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _loading = false;
        });
      }
    }
  }

  Future<void> _toggleFavorite() async {
    if (_item == null) return;
    await _db.contentDao.toggleFavorite(_item!.id);
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        backgroundColor: AppColors.backgroundBase,
        appBar: _buildAppBar(null),
        body: const Center(
          child: Text('LOADING...', style: TextStyle()),
        ),
      );
    }

    if (_error != null) {
      return Scaffold(
        backgroundColor: AppColors.backgroundBase,
        appBar: _buildAppBar(null),
        body: Center(
          child: Text('ERROR: $_error', style: AppTypography.label),
        ),
      );
    }

    if (_item == null) {
      return Scaffold(
        backgroundColor: AppColors.backgroundBase,
        appBar: _buildAppBar(null),
        body: const Center(
          child: Text('ITEM NOT FOUND.', style: TextStyle()),
        ),
      );
    }

    final item = _item!;

    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      appBar: _buildAppBar(item),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenH,
          vertical: AppSpacing.screenV,
        ),
        children: [
          // Title
          Text(
            item.title.toUpperCase(),
            style: AppTypography.heading,
          ),
          const SizedBox(height: AppSpacing.md),

          // Meta row
          Row(
            children: [
              if (item.difficulty != null) ...[
                _MetaTag(label: _difficultyLabel(item.difficulty!)),
                const SizedBox(width: 6),
              ],
              if (item.estimatedDurationMinutes != null)
                _MetaTag(label: '${item.estimatedDurationMinutes} MIN'),
              if (item.bestPracticeContext != null &&
                  item.bestPracticeContext!.isNotEmpty) ...[
                const SizedBox(width: 6),
                _MetaTag(label: item.bestPracticeContext!.toUpperCase()),
              ],
            ],
          ),

          // Excerpt
          if (item.excerpt != null && item.excerpt!.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.lg),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.cardPad),
              decoration: BoxDecoration(
                color: AppColors.backgroundSurface,
                border: Border.all(color: AppColors.borderNormal),
              ),
              child: Text(item.excerpt!, style: AppTypography.bodyMuted),
            ),
          ],

          const SizedBox(height: AppSpacing.lg),

          // Divider label
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('CONTENT', style: AppTypography.label),
          ),
          Container(height: 1, color: AppColors.borderSubtle),
          const SizedBox(height: AppSpacing.md),

          // Body
          Text(item.body, style: AppTypography.dataOutput),

          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }

  AppBar _buildAppBar(ContentItem? item) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Text(
        item?.title.toUpperCase() ?? '',
        style: AppTypography.heading,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        if (item != null)
          IconButton(
            icon: TerminalGlyph(
              item.isFavorited ? Glyphs.starFilled : Glyphs.starEmpty,
              size: 16,
              color: item.isFavorited ? AppColors.amber : AppColors.textMuted,
            ),
            onPressed: _toggleFavorite,
            tooltip: item.isFavorited ? 'Remove from Favorites' : 'Add to Favorites',
          ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: AppColors.borderSubtle),
      ),
    );
  }

  String _difficultyLabel(int difficulty) {
    switch (difficulty) {
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
