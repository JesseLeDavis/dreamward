import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

class AffirmationsManageScreen extends StatefulWidget {
  const AffirmationsManageScreen({super.key});

  @override
  State<AffirmationsManageScreen> createState() =>
      _AffirmationsManageScreenState();
}

class _AffirmationsManageScreenState extends State<AffirmationsManageScreen> {
  final _db = GetIt.instance<AppDatabase>();

  Future<void> _delete(ContentItem item) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.backgroundSurface,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: Text('DELETE AFFIRMATION?', style: AppTypography.heading),
        content: Text(
          'This affirmation will be removed from your library.',
          style: AppTypography.signalText,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text('CANCEL',
                style: AppTypography.label.copyWith(color: AppColors.amber)),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text('DELETE',
                style: AppTypography.label
                    .copyWith(color: AppColors.statusAlert)),
          ),
        ],
      ),
    );
    if (confirm == true) {
      await _db.contentDao.archiveContentItem(item.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDeep,
        iconTheme:
            const IconThemeData(color: AppColors.textSecondary, size: 18),
        title: Text('AFFIRMATIONS', style: AppTypography.heading),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 20, color: AppColors.amber),
            tooltip: 'New affirmation',
            onPressed: () => context.pushNamed(AppRoutes.affirmationNew),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.borderSubtle),
        ),
      ),
      body: StreamBuilder<List<ContentItem>>(
        stream: _db.contentDao.watchContentByType(1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('LOADING...', style: AppTypography.labelAmber),
            );
          }
          final items = snapshot.data ?? const <ContentItem>[];
          if (items.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('NO AFFIRMATIONS.', style: AppTypography.labelAmber),
                    const SizedBox(height: 8),
                    Text(
                      'Tap + to write your first declaration.',
                      style: AppTypography.signalText,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }

          // Sort: user-owned first, then built-in.
          final sorted = [...items]
            ..sort((a, b) {
              if (a.isBuiltIn == b.isBuiltIn) return 0;
              return a.isBuiltIn ? 1 : -1;
            });

          return ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenH,
              vertical: AppSpacing.screenV,
            ),
            itemCount: sorted.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) {
              final item = sorted[i];
              return _AffirmationRow(
                item: item,
                onEdit: item.isBuiltIn
                    ? null
                    : () => context.pushNamed(
                          AppRoutes.affirmationEdit,
                          pathParameters: {'id': item.id.toString()},
                        ),
                onDelete: item.isBuiltIn ? null : () => _delete(item),
              );
            },
          );
        },
      ),
    );
  }
}

class _AffirmationRow extends StatelessWidget {
  const _AffirmationRow({
    required this.item,
    required this.onEdit,
    required this.onDelete,
  });

  final ContentItem item;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final readOnly = item.isBuiltIn;
    return GestureDetector(
      onTap: onEdit,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundSurface,
          border: Border.all(color: AppColors.borderNormal),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.cardPad,
          vertical: 12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: AppTypography.body,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: readOnly
                                ? AppColors.borderSubtle
                                : AppColors.amberDim,
                          ),
                        ),
                        child: Text(
                          readOnly ? 'BUILT-IN' : 'CUSTOM',
                          style: AppTypography.label.copyWith(
                            color: readOnly
                                ? AppColors.textMuted
                                : AppColors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (!readOnly) ...[
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.edit_outlined,
                    size: 16, color: AppColors.amber),
                onPressed: onEdit,
                tooltip: 'Edit',
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline,
                    size: 16, color: AppColors.statusAlert),
                onPressed: onDelete,
                tooltip: 'Delete',
                visualDensity: VisualDensity.compact,
              ),
            ] else
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 2),
                child: Icon(Icons.lock_outline,
                    size: 14, color: AppColors.textMuted),
              ),
          ],
        ),
      ),
    );
  }
}
