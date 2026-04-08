import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/data_tag.dart';
import '../../../../core/widgets/field_section.dart';
import '../../../../core/widgets/signal_loader.dart';

/// Shows all dreams and OBE sessions logged for a specific date.
class CalendarDayScreen extends StatefulWidget {
  const CalendarDayScreen({super.key, required this.date});

  /// Date in 'YYYY-MM-DD' format.
  final String date;

  @override
  State<CalendarDayScreen> createState() => _CalendarDayScreenState();
}

class _CalendarDayScreenState extends State<CalendarDayScreen> {
  final _db = GetIt.instance<AppDatabase>();

  late Future<_DayData> _dataFuture;

  static const _typeLabels = {
    0: 'NORMAL',
    1: 'LUCID',
    2: 'RECURRING',
    3: 'NIGHTMARE',
  };
  static const _typeColors = {
    1: AppColors.tagLucid,
    2: AppColors.tagRecurring,
    3: AppColors.tagNightmare,
  };

  static const _clarityLabels = [
    'FRAGMENTARY',
    'PARTIAL',
    'CLEAR',
    'VIVID',
    'CRYSTAL',
  ];

  static const _outcomeLabels = ['ATTEMPTED', 'PARTIAL', 'CLEAN'];
  static const _outcomeColors = [
    AppColors.statusAlert,
    AppColors.amber,
    AppColors.green,
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _dataFuture = Future.wait([
      _db.dreamDao.getDreamsByDate(widget.date),
      _db.obeDao.getObeLogsByDate(widget.date),
    ]).then((results) => _DayData(
          dreams: results[0] as List<Dream>,
          obeLogs: results[1] as List<ObeLog>,
        ));
  }

  void _refresh() {
    setState(_loadData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      appBar: AppBar(
        title: Text(widget.date, style: AppTypography.heading),
        backgroundColor: AppColors.backgroundDeep,
      ),
      body: FutureBuilder<_DayData>(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: SignalLoader());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'ERROR LOADING DATA',
                style: AppTypography.bodyMuted,
              ),
            );
          }

          final data = snapshot.data!;
          final hasDreams = data.dreams.isNotEmpty;
          final hasObe = data.obeLogs.isNotEmpty;
          final hasAny = hasDreams || hasObe;

          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenH,
              vertical: AppSpacing.screenV,
            ),
            children: [
              if (!hasAny)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48),
                  child: Center(
                    child: Text(
                      'NO ENTRIES FOR THIS DATE',
                      style: AppTypography.bodyMuted,
                    ),
                  ),
                ),

              // --- Dreams section ---
              if (hasDreams) ...[
                FieldSection(
                  label: 'DREAMS',
                  trailing: Text(
                    '${data.dreams.length}',
                    style: AppTypography.labelAmber,
                  ),
                  contentPadding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      for (var i = 0; i < data.dreams.length; i++) ...[
                        if (i > 0)
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: AppColors.borderSubtle,
                          ),
                        _buildDreamCard(data.dreams[i]),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.sectionGap),
              ],

              // --- OBE sessions section ---
              if (hasObe) ...[
                FieldSection(
                  label: 'SESSIONS',
                  trailing: Text(
                    '${data.obeLogs.length}',
                    style: AppTypography.labelAmber,
                  ),
                  contentPadding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      for (var i = 0; i < data.obeLogs.length; i++) ...[
                        if (i > 0)
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: AppColors.borderSubtle,
                          ),
                        _buildObeCard(data.obeLogs[i]),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.sectionGap),
              ],

              // --- Action buttons ---
              const SizedBox(height: AppSpacing.sectionGap),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        await context.pushNamed(
                          AppRoutes.dreamNew,
                          queryParameters: {'date': widget.date},
                        );
                        _refresh();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.borderSubtle),
                        foregroundColor: AppColors.textSecondary,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: const Text('+ LOG DREAM'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        await context.pushNamed(
                          AppRoutes.obeNew,
                          queryParameters: {'date': widget.date},
                        );
                        _refresh();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.borderSubtle),
                        foregroundColor: AppColors.textSecondary,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: const Text('+ LOG OBE'),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDreamCard(Dream dream) {
    final typeLabel = _typeLabels[dream.dreamType] ?? 'NORMAL';
    final typeColor =
        _typeColors[dream.dreamType] ?? AppColors.tagFragmented;
    final clarityIndex = dream.clarity.clamp(0, _clarityLabels.length - 1);
    final clarityLabel = _clarityLabels[clarityIndex];

    return InkWell(
      onTap: () async {
        await context.pushNamed(
          AppRoutes.calendarDreamDetail,
          pathParameters: {
            'date': widget.date,
            'dreamId': dream.id.toString(),
          },
        );
        _refresh();
      },
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dream.title.toUpperCase(),
              style: AppTypography.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                DataTag(label: typeLabel, color: typeColor),
                const SizedBox(width: 8),
                Text(
                  clarityLabel,
                  style: AppTypography.tag.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static const _obeTypeLabels = ['DELIBERATE', 'AMBIENT', 'BRIDGE'];

  Widget _buildObeCard(ObeLog log) {
    final sessionType = _obeTypeLabels[log.sessionType.clamp(0, 2)];
    final outcomeIndex = log.entryState.clamp(0, _outcomeLabels.length - 1);
    final outcomeLabel = _outcomeLabels[outcomeIndex];
    final outcomeColor = _outcomeColors[outcomeIndex];
    final technique = log.techniqueNameOverride;

    return InkWell(
      onTap: () async {
        await context.pushNamed(
          AppRoutes.calendarObeDetail,
          pathParameters: {
            'date': widget.date,
            'obeId': log.id.toString(),
          },
        );
        _refresh();
      },
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                DataTag(label: sessionType, color: AppColors.amber),
                const SizedBox(width: 8),
                DataTag(label: outcomeLabel, color: outcomeColor),
              ],
            ),
            if (technique != null && technique.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                technique.toUpperCase(),
                style: AppTypography.bodyMuted,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }

}

class _DayData {
  final List<Dream> dreams;
  final List<ObeLog> obeLogs;

  const _DayData({required this.dreams, required this.obeLogs});
}
