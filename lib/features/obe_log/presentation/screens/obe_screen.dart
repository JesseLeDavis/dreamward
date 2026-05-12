import 'dart:async';

import 'package:flutter/material.dart';
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
import '../bloc/obe_log_bloc.dart';

class ObeScreen extends StatefulWidget {
  const ObeScreen({super.key});

  @override
  State<ObeScreen> createState() => _ObeScreenState();
}

class _ObeScreenState extends State<ObeScreen> {
  String _typeFilter = 'ALL';
  String _stateFilter = 'ALL';
  bool _filtersExpanded = false;
  String _searchQuery = '';
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    context.read<ObeLogBloc>().add(LoadObeLogs());
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
      setState(() => _searchQuery = value.trim().toLowerCase());
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _searchQuery = '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      appBar: const _ObeAppBar(),
      body: Column(
        children: [
          _CollapsedFilterBar(
            hasActiveFilter: _typeFilter != 'ALL' || _stateFilter != 'ALL',
            expanded: _filtersExpanded,
            onTap: () =>
                setState(() => _filtersExpanded = !_filtersExpanded),
          ),
          if (_filtersExpanded)
            _FilterBar(
              typeFilter: _typeFilter,
              stateFilter: _stateFilter,
              onTypeFilter: (v) => setState(() => _typeFilter = v),
              onStateFilter: (v) => setState(() => _stateFilter = v),
            ),
          SignalSearchField(
            controller: _searchController,
            onChanged: _onSearchChanged,
            onClear: _clearSearch,
            hintText: 'SEARCH EXCURSIONS...',
          ),
          Expanded(
            child: _ObeList(
              typeFilter: _typeFilter,
              stateFilter: _stateFilter,
              searchQuery: _searchQuery,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// App bar + filter bar
// ---------------------------------------------------------------------------

class _ObeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ObeAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(48 + 1);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('OBE LOG', style: AppTypography.heading),
      actions: [
        IconButton(
          icon: const TerminalGlyph(Glyphs.help, size: 16),
          onPressed: () => context.pushNamed(AppRoutes.fieldGuide),
          tooltip: 'Field Guide',
        ),
        IconButton(
          icon: const Icon(Icons.add, size: 24, color: AppColors.amber),
          onPressed: () => context.pushNamed(AppRoutes.obeNew),
          tooltip: 'Log OBE',
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
  const _FilterBar({
    required this.typeFilter,
    required this.stateFilter,
    required this.onTypeFilter,
    required this.onStateFilter,
  });

  final String typeFilter;
  final String stateFilter;
  final ValueChanged<String> onTypeFilter;
  final ValueChanged<String> onStateFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundDeep,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenH,
        vertical: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _FilterRow(
            label: 'TYPE',
            options: const ['ALL', 'DELIBERATE', 'AMBIENT', 'BRIDGE'],
            selected: typeFilter,
            onSelect: onTypeFilter,
          ),
          const SizedBox(height: 8),
          _FilterRow(
            label: 'STATE',
            options: const ['ALL', 'CLEAN', 'PARTIAL', 'ATTEMPTED'],
            selected: stateFilter,
            onSelect: onStateFilter,
          ),
        ],
      ),
    );
  }
}

class _CollapsedFilterBar extends StatelessWidget {
  const _CollapsedFilterBar({
    required this.hasActiveFilter,
    required this.expanded,
    required this.onTap,
  });

  final bool hasActiveFilter;
  final bool expanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 36,
        color: AppColors.backgroundDeep,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
        child: Row(
          children: [
            Text('FILTERS', style: AppTypography.label),
            const SizedBox(width: 10),
            Text(
              hasActiveFilter ? '· ACTIVE' : '· ALL',
              style: AppTypography.label.copyWith(
                color: hasActiveFilter
                    ? AppColors.amber
                    : AppColors.textSecondary,
              ),
            ),
            const Spacer(),
            Text(expanded ? 'COLLAPSE ▴' : 'EXPAND ▾',
                style: AppTypography.labelAmber),
          ],
        ),
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow({
    required this.label,
    required this.options,
    required this.selected,
    required this.onSelect,
  });

  final String label;
  final List<String> options;
  final String selected;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 44,
          child: Text(label, style: AppTypography.label),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: options.map((opt) {
                final active = opt == selected;
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: GestureDetector(
                    onTap: () => onSelect(opt),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: active
                            ? AppColors.amberMuted
                            : Colors.transparent,
                        border: Border.all(
                          color: active
                              ? AppColors.amber
                              : AppColors.borderSubtle,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        opt,
                        style: AppTypography.tag.copyWith(
                          color: active
                              ? AppColors.amber
                              : AppColors.textMuted,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// OBE list
// ---------------------------------------------------------------------------

class _ObeList extends StatelessWidget {
  const _ObeList({
    required this.typeFilter,
    required this.stateFilter,
    required this.searchQuery,
  });

  final String typeFilter;
  final String stateFilter;
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObeLogBloc, ObeLogState>(
      builder: (context, state) {
        if (state is ObeLogLoading || state is ObeLogInitial) {
          return const Center(child: SignalLoader());
        }

        if (state is ObeLogError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Text(
                'ERROR: ${state.message}',
                style: AppTypography.label.copyWith(color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        final allLogs =
            state is ObeLogLoaded ? state.logs : <ObeLog>[];

        if (allLogs.isEmpty) {
          return _EmptyState();
        }

        final filtered = allLogs.where((log) {
          final type = _sessionTypeLabel(log.sessionType);
          final stateLabel = _stateLabel(log.entryState);
          final typeMatch = typeFilter == 'ALL' || type == typeFilter;
          final stateMatch = stateFilter == 'ALL' || stateLabel == stateFilter;
          final searchMatch = searchQuery.isEmpty ||
              log.description.toLowerCase().contains(searchQuery) ||
              (log.intention?.toLowerCase().contains(searchQuery) ?? false);
          return typeMatch && stateMatch && searchMatch;
        }).toList();

        if (filtered.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Text(
                'NO ENTRIES MATCH CURRENT FILTER.',
                style: AppTypography.label,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenH,
            vertical: AppSpacing.screenV,
          ),
          itemCount: filtered.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: AppSpacing.cardGap),
          itemBuilder: (context, i) {
            final log = filtered[i];
            return _ObeCard(
              log: log,
              onTap: () => context.pushNamed(
                AppRoutes.obeDetail,
                pathParameters: {'obeId': log.id.toString()},
              ),
            );
          },
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Helpers for mapping ObeLog fields to display values
// ---------------------------------------------------------------------------

String _sessionTypeLabel(int sessionType) {
  return switch (sessionType) {
    1 => 'AMBIENT',
    2 => 'BRIDGE',
    _ => 'DELIBERATE',
  };
}

String _stateLabel(int entryState) {
  return switch (entryState) {
    2 => 'CLEAN',
    1 => 'PARTIAL',
    _ => 'ATTEMPTED',
  };
}

String _formatDate(DateTime dt) {
  const months = [
    '', 'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
    'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC',
  ];
  return '${dt.day.toString().padLeft(2, '0')} ${months[dt.month]}';
}

// ---------------------------------------------------------------------------
// OBE card — Monroe framework enhanced
// ---------------------------------------------------------------------------

class _ObeCard extends StatelessWidget {
  const _ObeCard({required this.log, required this.onTap});

  final ObeLog log;
  final VoidCallback onTap;

  Color get _stateColor {
    return switch (log.entryState) {
      2 => AppColors.green,
      1 => AppColors.amber,
      _ => AppColors.textMuted,
    };
  }

  @override
  Widget build(BuildContext context) {
    return NeuPressable(
      radius: 14,
      padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
      onPressed: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardHeader(log: log, stateColor: _stateColor),
          const SizedBox(height: 10),
          _MonroeStrip(log: log),
          const SizedBox(height: 10),
          _CardBody(log: log),
        ],
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader({required this.log, required this.stateColor});

  final ObeLog log;
  final Color stateColor;

  @override
  Widget build(BuildContext context) {
    final sessionType = _sessionTypeLabel(log.sessionType);
    final technique = log.techniqueNameOverride?.toUpperCase() ?? '---';
    final label = _stateLabel(log.entryState);
    final date = _formatDate(log.createdAt);

    return Row(
      children: [
        Text(date, style: AppTypography.timestamp),
        const SizedBox(width: 10),
        Text(sessionType, style: AppTypography.label),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            technique,
            style: AppTypography.label,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 6),
        DataTag(label: label, color: stateColor),
      ],
    );
  }
}

class _MonroeStrip extends StatelessWidget {
  const _MonroeStrip({required this.log});

  final ObeLog log;

  @override
  Widget build(BuildContext context) {
    // focusLevel in DB is 0-3 (PHASE I–IV); _FocusLevelBar expects 0=none, 1-4=phases
    // so we add 1 when a level is set, or pass 0 for "not recorded"
    final barLevel = log.focusLevel != null ? log.focusLevel! + 1 : 0;
    final onsetReached = log.onsetReached;
    final onsetIntensity = log.onsetIntensity;

    return Row(
      children: [
        _FocusLevelBar(level: barLevel),
        const SizedBox(width: 12),
        _VibrationIndicator(
          reached: onsetReached,
          intensity: onsetIntensity,
        ),
        if (log.fieldType != null) ...[
          const SizedBox(width: 12),
          DataTag(
            label: _fieldTypeLabel(log.fieldType!),
            color: AppColors.statusSleep,
          ),
        ],
      ],
    );
  }

  String _fieldTypeLabel(int fieldType) {
    return switch (fieldType) {
      0 => 'LOCAL',
      1 => 'EXPANDED',
      2 => 'PARALLEL',
      _ => 'FIELD --',
    };
  }
}

class _CardBody extends StatelessWidget {
  const _CardBody({required this.log});

  final ObeLog log;

  @override
  Widget build(BuildContext context) {
    return Text(
      log.description,
      style: AppTypography.dataOutput,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

// ---------------------------------------------------------------------------
// Focus level bar — 4 segments (PHASE I / II / III / IV)
// ---------------------------------------------------------------------------

class _FocusLevelBar extends StatelessWidget {
  const _FocusLevelBar({required this.level});

  /// 0 = not recorded, 1 = PHASE I, 2 = PHASE II, 3 = PHASE III, 4 = PHASE IV
  final int level;

  static const _labels = ['---', 'PHASE I', 'PHASE II', 'PHASE III', 'PHASE IV'];

  @override
  Widget build(BuildContext context) {
    final label = _labels[level.clamp(0, 4)];
    final labelStyle = level > 0
        ? AppTypography.labelAmber
        : AppTypography.label.copyWith(color: AppColors.textSecondary);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: labelStyle),
        const SizedBox(width: 4),
        for (int i = 1; i <= 4; i++)
          Container(
            width: 7,
            height: 14,
            margin: const EdgeInsets.only(left: 2),
            color: i <= level ? AppColors.amber : AppColors.borderStrong,
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Onset indicator
// ---------------------------------------------------------------------------

class _VibrationIndicator extends StatelessWidget {
  const _VibrationIndicator({required this.reached, this.intensity});

  final bool reached;
  final int? intensity; // 1=TRACE, 2=STRONG, 3=SURGE

  static const _intensityLabels = ['', 'TRACE', 'STRONG', 'SURGE'];

  @override
  Widget build(BuildContext context) {
    if (!reached) {
      return Text(
        'NO ONSET',
        style: AppTypography.label.copyWith(color: AppColors.textSecondary),
      );
    }

    final intensityLabel = intensity != null
        ? _intensityLabels[intensity!.clamp(1, 3)]
        : '';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'ONSET: ',
          style: AppTypography.label.copyWith(color: AppColors.textSecondary),
        ),
        if (intensity != null)
          Text(
            intensityLabel,
            style: AppTypography.label.copyWith(color: AppColors.green),
          ),
        if (intensity != null) ...[
          const SizedBox(width: 4),
          for (int i = 1; i <= 3; i++)
            Container(
              width: 7,
              height: 14,
              margin: const EdgeInsets.only(left: 2),
              color: i <= intensity! ? AppColors.amber : AppColors.borderStrong,
            ),
        ],
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Empty state
// ---------------------------------------------------------------------------

class _EmptyState extends StatelessWidget {
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
                  Text('OBE LOG', style: AppTypography.label),
                  const Spacer(),
                  Text(
                    'NO EXCURSIONS LOGGED.',
                    style: AppTypography.label
                        .copyWith(color: AppColors.textMuted),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text('PHASE PROGRESSION', style: AppTypography.label),
              const SizedBox(height: 10),
              _FocusRow('PHASE I', 'BODY RELAXED / MIND ALERT'),
              _FocusRow('PHASE II', 'EXPANDED AWARENESS'),
              _FocusRow('PHASE III', 'THRESHOLD STATE'),
              _FocusRow('PHASE IV', 'FULL SEPARATION'),
              const SizedBox(height: AppSpacing.lg),
              Text('FIELD UNIT READY.', style: AppTypography.label),
              const SizedBox(height: 4),
              Text(
                'Onset. Field type. Target.',
                style: AppTypography.signalText,
              ),
              Text(
                'Separation is a skill. Log everything.',
                style: AppTypography.signalText,
              ),
              const SizedBox(height: AppSpacing.lg),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () =>
                      context.pushNamed(AppRoutes.obeNew),
                  child: const Text('+ BEGIN FIRST EXCURSION RECORD'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FocusRow extends StatelessWidget {
  const _FocusRow(this.level, this.description);

  final String level;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text(level, style: AppTypography.labelAmber),
          const SizedBox(width: 8),
          Flexible(child: Text(description, style: AppTypography.bodyMuted)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Search field
// ---------------------------------------------------------------------------




