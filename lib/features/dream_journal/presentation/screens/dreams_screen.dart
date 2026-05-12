import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/neu_surface.dart';
import '../../../../core/widgets/data_tag.dart';
import '../../../../core/widgets/signal_loader.dart';
import '../../../../core/widgets/signal_search_field.dart';
import '../../../../core/widgets/terminal_glyph.dart';
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
          icon: const Icon(Icons.add, size: 24, color: AppColors.amber),
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
                border: Border(
                    bottom: BorderSide(color: AppColors.borderSubtle)),
              ),
              child: Row(
                children: [
                  // Tag filter button — fixed on the left.
                  _FilterButton(
                    label: 'TAG',
                    glyph: Glyphs.tag,
                    onTap: () async {
                      final bloc = context.read<DreamJournalBloc>();
                      final activeIds =
                          loaded?.activeTagIds ?? const <int>[];
                      final initial = entityState.tags
                          .where((t) => activeIds.contains(t.id))
                          .toList();
                      final result = await showTagPicker(
                        context,
                        initialSelected: initial,
                      );
                      if (result == null) return;
                      bloc.add(FilterByTags(
                        result.map((t) => t.id).toList(),
                        result.map((t) => t.name).toList(),
                      ));
                    },
                  ),
                  const SizedBox(width: 12),

                  // Character filter button — fixed on the left.
                  _FilterButton(
                    label: 'CHARACTER',
                    glyph: Glyphs.character,
                    onTap: () async {
                      final bloc = context.read<DreamJournalBloc>();
                      final activeIds =
                          loaded?.activeCharacterIds ?? const <int>[];
                      final initial = entityState.characters
                          .where((c) => activeIds.contains(c.id))
                          .toList();
                      final result = await showCharacterPicker(
                        context,
                        initialSelected: initial,
                      );
                      if (result == null) return;
                      bloc.add(FilterByCharacters(
                        result.map((c) => c.id).toList(),
                        result.map((c) => c.name).toList(),
                      ));
                    },
                  ),

                  // Active filter chips — fill remaining space, scrollable.
                  if (isFiltered) ...[
                    const SizedBox(width: 10),
                    Container(
                      width: 1,
                      height: 16,
                      color: AppColors.borderStrong,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var i = 0;
                                i < loaded!.activeTagIds.length;
                                i++) ...[
                              if (i > 0) const SizedBox(width: 8),
                              _ActiveFilterChip(
                                label:
                                    loaded.activeTagNames[i].toUpperCase(),
                                color: () {
                                  final tagId = loaded.activeTagIds[i];
                                  final tag = entityState.tags
                                      .where((t) => t.id == tagId)
                                      .firstOrNull;
                                  return tag != null
                                      ? _parseTagColor(tag.color)
                                      : AppColors.amber;
                                }(),
                                prefix: 'TAG:',
                                onClear: () {
                                  final ids =
                                      List<int>.from(loaded.activeTagIds)
                                        ..removeAt(i);
                                  final names = List<String>.from(
                                      loaded.activeTagNames)
                                    ..removeAt(i);
                                  context
                                      .read<DreamJournalBloc>()
                                      .add(FilterByTags(ids, names));
                                },
                              ),
                            ],
                            for (var i = 0;
                                i < loaded.activeCharacterIds.length;
                                i++) ...[
                              if (i > 0 || loaded.activeTagIds.isNotEmpty)
                                const SizedBox(width: 8),
                              _ActiveFilterChip(
                                label: loaded.activeCharacterNames[i]
                                    .toUpperCase(),
                                color: AppColors.statusSleep,
                                prefix: 'CHARACTER:',
                                onClear: () {
                                  final ids = List<int>.from(
                                      loaded.activeCharacterIds)
                                    ..removeAt(i);
                                  final names = List<String>.from(
                                      loaded.activeCharacterNames)
                                    ..removeAt(i);
                                  context
                                      .read<DreamJournalBloc>()
                                      .add(FilterByCharacters(ids, names));
                                },
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
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
    required this.glyph,
    required this.onTap,
  });

  final String label;
  final String glyph;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return NeuPressable(
      radius: 10,
      intensity: 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TerminalGlyph(glyph, size: 12, color: AppColors.textMuted),
          const SizedBox(width: 8),
          Text(label,
              style: AppTypography.tag.copyWith(color: AppColors.textMuted)),
        ],
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
      decoration: BoxDecoration(
        color: AppColors.amberMuted,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 6, 8),
            child: Text(
              '$prefix $label',
              style: AppTypography.tag.copyWith(color: color),
              maxLines: 1,
              softWrap: false,
            ),
          ),
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              onClear();
            },
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              width: 36,
              height: 36,
              child: Center(
                child: TerminalGlyph(Glyphs.close, size: 14, color: color),
              ),
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
            separatorBuilder: (_, __) =>
                const SizedBox(height: AppSpacing.cardGap),
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
    return NeuPressable(
      radius: 14,
      padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
      onPressed: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row: date + type
          Row(
            children: [
              Text(_dateLabel, style: AppTypography.timestamp),
              const SizedBox(width: 10),
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
              const TerminalGlyph(
                Glyphs.chevronRight,
                size: 14,
                color: AppColors.textMuted,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            _snippet,
            style: AppTypography.dataOutput,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              DataTag(label: _typeLabel, color: _tagColor),
              const Spacer(),
              _ClarityBar(clarity: dream.clarity),
            ],
          ),
        ],
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
        child: NeuRaised(
          radius: 16,
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
              const SizedBox(height: 14),
              Text('DREAM TYPES', style: AppTypography.label),
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

