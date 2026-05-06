import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/data_tag.dart';
import '../../../../core/widgets/signal_loader.dart';
import '../../../../core/widgets/signal_search_field.dart';
import '../bloc/dream_journal_bloc.dart';
import '../bloc/entity_cubit.dart';
import '../widgets/character_picker_sheet.dart';
import '../widgets/tag_picker_sheet.dart';

class DreamsScreen extends StatefulWidget {
  const DreamsScreen({super.key});

  @override
  State<DreamsScreen> createState() => _DreamsScreenState();
}

class _DreamsScreenState extends State<DreamsScreen> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    context.read<DreamJournalBloc>().add(LoadDreams());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      context.read<DreamJournalBloc>().add(SearchDreams(value));
    });
  }

  void _clearSearch() {
    _searchController.clear();
    context.read<DreamJournalBloc>().add(SearchDreams(''));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DreamJournalBloc, DreamJournalState>(
      listener: (context, state) {
        // Clear search field when a tag/character filter is applied
        if (state is DreamJournalLoaded &&
            state.isFiltered &&
            _searchController.text.isNotEmpty) {
          _searchController.clear();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundBase,
        appBar: _DreamsAppBar(),
        body: Column(
          children: [
            const _FilterBar(),
            SignalSearchField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              onClear: _clearSearch,
              hintText: 'SEARCH TRANSMISSIONS...',
            ),
            const Expanded(child: _DreamList()),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// App bar
// ---------------------------------------------------------------------------

class _DreamsAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(48 + 1);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('DREAM LOG', style: AppTypography.heading),
      actions: [
        IconButton(
          icon: const Icon(Icons.add, size: 20),
          color: AppColors.amber,
          onPressed: () => context.pushNamed(AppRoutes.dreamNew),
          tooltip: 'Log Dream',
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: AppColors.borderSubtle),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Filter bar
// ---------------------------------------------------------------------------

class _FilterBar extends StatelessWidget {
  const _FilterBar();

  Color _parseTagColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return AppColors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DreamJournalBloc, DreamJournalState>(
      builder: (context, state) {
        final loaded = state is DreamJournalLoaded ? state : null;
        final isFiltered = loaded?.isFiltered ?? false;

        return BlocBuilder<EntityCubit, EntityState>(
          builder: (context, entityState) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenH, vertical: 10),
              decoration: const BoxDecoration(
                color: AppColors.backgroundDeep,
                border: Border(
                    bottom: BorderSide(color: AppColors.borderSubtle)),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Tag filter button
                    _FilterButton(
                      label: 'TAG',
                      icon: Icons.label_outline,
                      onTap: () async {
                        final bloc =
                            context.read<DreamJournalBloc>();
                        final result = await showTagPicker(context);
                        if (result != null && result.isNotEmpty) {
                          bloc.add(FilterByTag(
                              result.first.id, result.first.name));
                        }
                      },
                    ),
                    const SizedBox(width: 6),

                    // Character filter button
                    _FilterButton(
                      label: 'CHARACTER',
                      icon: Icons.person_outline,
                      onTap: () async {
                        final bloc =
                            context.read<DreamJournalBloc>();
                        final result = await showCharacterPicker(context);
                        if (result != null && result.isNotEmpty) {
                          bloc.add(FilterByCharacter(
                              result.first.id, result.first.name));
                        }
                      },
                    ),

                    // Active filter chip
                    if (isFiltered) ...[
                      const SizedBox(width: 10),
                      Container(
                        width: 1,
                        height: 16,
                        color: AppColors.borderStrong,
                      ),
                      const SizedBox(width: 10),
                      if (loaded!.activeTagId != null)
                        _ActiveFilterChip(
                          label: loaded.activeTagName!.toUpperCase(),
                          color: () {
                            final tag = entityState.tags
                                .where((t) => t.id == loaded.activeTagId)
                                .firstOrNull;
                            return tag != null
                                ? _parseTagColor(tag.color)
                                : AppColors.amber;
                          }(),
                          prefix: 'TAG:',
                          onClear: () => context
                              .read<DreamJournalBloc>()
                              .add(ClearDreamFilter()),
                        )
                      else if (loaded.activeCharacterId != null)
                        _ActiveFilterChip(
                          label:
                              loaded.activeCharacterName!.toUpperCase(),
                          color: AppColors.statusSleep,
                          prefix: 'CHARACTER:',
                          onClear: () => context
                              .read<DreamJournalBloc>()
                              .add(ClearDreamFilter()),
                        ),
                    ],
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderNormal),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 12, color: AppColors.textMuted),
            const SizedBox(width: 5),
            Text(label,
                style: AppTypography.tag.copyWith(color: AppColors.textMuted)),
          ],
        ),
      ),
    );
  }
}

class _ActiveFilterChip extends StatelessWidget {
  const _ActiveFilterChip({
    required this.label,
    required this.color,
    required this.prefix,
    required this.onClear,
  });

  final String label;
  final Color color;
  final String prefix;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.amberMuted,
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$prefix $label',
            style: AppTypography.tag.copyWith(color: color),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onClear,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Icon(Icons.close, size: 12, color: color),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Dream list
// ---------------------------------------------------------------------------

class _DreamList extends StatelessWidget {
  const _DreamList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DreamJournalBloc, DreamJournalState>(
      builder: (context, state) {
        if (state is DreamJournalLoading || state is DreamJournalInitial) {
          return const Center(child: SignalLoader());
        }

        if (state is DreamJournalError) {
          return Center(
            child: Text('ERROR: ${state.message}', style: AppTypography.label),
          );
        }

        if (state is DreamJournalLoaded) {
          final dreams = state.dreams;

          if (dreams.isEmpty && (state.isSearching || state.isFiltered)) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Text('NO SIGNAL MATCH.', style: AppTypography.label),
              ),
            );
          }

          if (dreams.isEmpty) {
            return _DreamsEmptyState();
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenH,
              vertical: AppSpacing.screenV,
            ),
            itemCount: dreams.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) => _DreamCard(
              dream: dreams[i],
              onTap: () => context.pushNamed(
                AppRoutes.dreamDetail,
                pathParameters: {'dreamId': dreams[i].id.toString()},
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Dream card
// ---------------------------------------------------------------------------

class _DreamCard extends StatelessWidget {
  const _DreamCard({required this.dream, required this.onTap});

  final Dream dream;
  final VoidCallback onTap;

  static const _typeLabels = {
    0: 'NORMAL',
    1: 'LUCID',
    2: 'RECURRING',
    3: 'NIGHTMARE',
    4: 'PROPHETIC',
    5: 'VISITATION',
    6: 'HYPNAGOGIC',
  };

  static const _typeColors = {
    1: AppColors.tagLucid,
    2: AppColors.tagRecurring,
    3: AppColors.tagNightmare,
  };

  String get _dateLabel {
    if (dream.rundownDate != null) return dream.rundownDate!;
    final d = dream.createdAt;
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  String get _typeLabel => _typeLabels[dream.dreamType] ?? 'NORMAL';

  Color get _tagColor => _typeColors[dream.dreamType] ?? AppColors.tagFragmented;

  String get _snippet => dream.summary ?? dream.description;

  bool get _isContinuation => dream.continuationChainId != null;

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
            // Header row: date + type
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
                  Text(_dateLabel, style: AppTypography.timestamp),
                  const SizedBox(width: 8),
                  Container(width: 1, height: 10, color: AppColors.borderStrong),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      _typeLabel.toUpperCase(),
                      style: AppTypography.label,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 6),
                  if (_isContinuation)
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Text('CHAIN', style: AppTypography.labelAmber),
                    ),
                  const Icon(
                    Icons.chevron_right,
                    size: 14,
                    color: AppColors.textMuted,
                  ),
                ],
              ),
            ),

            // Snippet + clarity + tag
            Padding(
              padding: const EdgeInsets.all(AppSpacing.cardPad),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _snippet,
                    style: AppTypography.dataOutput,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      DataTag(label: _typeLabel, color: _tagColor),
                      const Spacer(),
                      _ClarityBar(clarity: dream.clarity),
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
// Clarity bar (0–4 from DB → renders 0–4 filled segments out of 5)
// ---------------------------------------------------------------------------

class _ClarityBar extends StatelessWidget {
  const _ClarityBar({required this.clarity});

  final int clarity; // 0–4 from DB

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('CLR ', style: AppTypography.label),
        for (int i = 1; i <= 5; i++)
          Container(
            width: 8,
            height: 16,
            margin: const EdgeInsets.only(left: 2),
            color: i <= clarity + 1 ? AppColors.amber : AppColors.borderStrong,
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Empty state — teaches dream type vocabulary
// ---------------------------------------------------------------------------

class _DreamsEmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.screenH),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundSurface,
            border: Border.all(color: AppColors.borderStrong),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.cardPad,
                  vertical: 8,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.borderSubtle),
                  ),
                ),
                child: Row(
                  children: [
                    Text('DREAM LOG', style: AppTypography.label),
                    const Spacer(),
                    Text(
                      'NO TRANSMISSIONS ON RECORD.',
                      style: AppTypography.label
                          .copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('DREAM TYPES', style: AppTypography.label),
                    const SizedBox(height: 4),
                    const Divider(height: 1, color: AppColors.borderSubtle),
                    const SizedBox(height: 10),
                    _DreamTypeRow('NORMAL', 'BASELINE NIGHT IMAGERY'),
                    _DreamTypeRow('LUCID', 'AWARE WITHIN THE DREAM'),
                    _DreamTypeRow('RECURRING', 'REPEATED MOTIF OR SCENE'),
                    _DreamTypeRow('NIGHTMARE', 'DISTRESS / FEAR SIGNAL'),
                    const SizedBox(height: AppSpacing.lg),
                    Text('CHANNEL OPEN.', style: AppTypography.label),
                    const SizedBox(height: 4),
                    Text(
                      'Signal is present. Recall what you find there.',
                      style: AppTypography.signalText,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () =>
                            context.pushNamed(AppRoutes.dreamNew),
                        child: const Text('+ OPEN FIRST LOG ENTRY'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DreamTypeRow extends StatelessWidget {
  const _DreamTypeRow(this.label, this.description);

  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 88,
            child: Text(label, style: AppTypography.labelAmber),
          ),
          Expanded(
            child: Text(
              description,
              style: AppTypography.label
                  .copyWith(color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}

