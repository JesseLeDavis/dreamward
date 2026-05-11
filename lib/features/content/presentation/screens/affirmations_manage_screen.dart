import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/empty_readout.dart';
import '../../../../core/widgets/signal_loader.dart';
import '../../../../core/widgets/terminal_dialog.dart';
import '../../../../core/widgets/terminal_glyph.dart';

class AffirmationsManageScreen extends StatefulWidget {
  const AffirmationsManageScreen({super.key});

  @override
  State<AffirmationsManageScreen> createState() =>
      _AffirmationsManageScreenState();
}

class _AffirmationsManageScreenState extends State<AffirmationsManageScreen> {
  final _db = GetIt.instance<AppDatabase>();

  Future<void> _delete(ContentItem item) async {
    final confirm = await TerminalDialog.confirm(
      context: context,
      title: 'DELETE AFFIRMATION?',
      message: 'This affirmation will be removed from your library.',
      confirmLabel: 'DELETE',
      destructive: true,
    );
    if (confirm) {
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
            icon: const TerminalGlyph(Glyphs.add, size: 18, color: AppColors.amber, weight: FontWeight.w700),
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
            return const Center(child: SignalLoader());
          }
          final items = snapshot.data ?? const <ContentItem>[];
          if (items.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: EmptyReadout(
                label: 'NO DECLARATIONS — CARRIER IDLE',
                sublabel: 'Write your first affirmation.',
                actionLabel: '+ NEW DECLARATION',
                onAction: () =>
                    context.pushNamed(AppRoutes.affirmationNew),
                height: 180,
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
                icon: const TerminalGlyph(Glyphs.edit,
                    size: 14, color: AppColors.amber),
                onPressed: onEdit,
                tooltip: 'Edit',
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                icon: const TerminalGlyph(Glyphs.delete,
                    size: 14, color: AppColors.statusAlert),
                onPressed: onDelete,
                tooltip: 'Delete',
                visualDensity: VisualDensity.compact,
              ),
            ] else
              const Padding(
                padding: EdgeInsets.only(left: 8, top: 2),
                child: TerminalGlyph(Glyphs.lock,
                    size: 12, color: AppColors.textMuted),
              ),
          ],
        ),
      ),
    );
  }
}
