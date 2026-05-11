import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/obe_dao.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/data_tag.dart';
import '../../../../core/widgets/field_section.dart';
import '../../../../core/widgets/signal_loader.dart';
import '../../../../core/widgets/terminal_glyph.dart';

class ObeDetailScreen extends StatefulWidget {
  const ObeDetailScreen({super.key, required this.obeId});

  final int obeId;

  @override
  State<ObeDetailScreen> createState() => _ObeDetailScreenState();
}

class _ObeDetailScreenState extends State<ObeDetailScreen> {
  ObeLogWithDetails? _data;
  bool _loading = true;
  String? _error;

  static const _outcomeLabels = ['ATTEMPTED', 'PARTIAL', 'CLEAN'];
  static const _outcomeColors = [
    AppColors.statusAlert,
    AppColors.amber,
    AppColors.green,
  ];

  static const _typeLabels = ['DELIBERATE', 'AMBIENT', 'BRIDGE'];
  static const _typeColors = [
    AppColors.amber,
    AppColors.green,
    AppColors.statusSleep,
  ];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final db = GetIt.instance<AppDatabase>();
      final result = await db.obeDao.getObeLogWithDetails(widget.obeId);
      if (!mounted) return;
      if (result == null) {
        setState(() {
          _loading = false;
          _error = 'LOG ENTRY NOT FOUND.';
        });
      } else {
        setState(() {
          _loading = false;
          _data = result;
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = 'LOAD FAILED: $e';
      });
    }
  }

  (String, Color) _sessionTypeMeta(int sessionType) {
    final idx = sessionType.clamp(0, _typeLabels.length - 1);
    return (_typeLabels[idx], _typeColors[idx]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDeep,
        automaticallyImplyLeading: true,
        iconTheme:
            const IconThemeData(color: AppColors.textSecondary, size: 18),
        title: Text('FIELD LOG', style: AppTypography.heading),
        actions: [
          if (!_loading && _data != null)
            IconButton(
              icon: const TerminalGlyph(Glyphs.edit, size: 16, color: AppColors.amber),
              onPressed: () async {
                await context.pushNamed(
                  AppRoutes.obeEdit,
                  pathParameters: {'obeId': widget.obeId.toString()},
                );
                _load();
              },
            ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.borderSubtle),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(
          child: SignalLoader(label: 'READING FIELD LOG...'));
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Text(_error!, style: AppTypography.label),
        ),
      );
    }

    final data = _data!;
    final log = data.log;

    final d = log.sessionDate;
    final dateLabel =
        '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

    final outcomeLabel = _outcomeLabels[log.entryState.clamp(0, 2)];
    final outcomeColor = _outcomeColors[log.entryState.clamp(0, 2)];

    final (typeLabel, typeColor) = _sessionTypeMeta(log.sessionType);
    final bodyText = log.description;

    final hasTechnique = (log.techniqueNameOverride ?? '').isNotEmpty;
    final hasTarget = (log.intention ?? '').isNotEmpty;
    final hasReflection = (log.postReflection ?? '').isNotEmpty;
    final hasNarrative = (log.experienceNarrative ?? '').isNotEmpty;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenH,
        vertical: AppSpacing.screenV,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Meta section ───────────────────────────────────
          FieldSection(
            label: 'SESSION META',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date + type + outcome
                Row(
                  children: [
                    Text(dateLabel, style: AppTypography.timestamp),
                    const SizedBox(width: 10),
                    Container(
                        width: 1,
                        height: 10,
                        color: AppColors.borderStrong),
                    const SizedBox(width: 10),
                    DataTag(label: typeLabel, color: typeColor),
                    const SizedBox(width: 6),
                    DataTag(label: outcomeLabel, color: outcomeColor),
                  ],
                ),

                if (log.durationMinutes != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('DURATION', style: AppTypography.label),
                      const SizedBox(width: 8),
                      Text(
                        '${log.durationMinutes} MIN',
                        style: AppTypography.timestamp
                            .copyWith(color: AppColors.textPrimary),
                      ),
                    ],
                  ),
                ],

                if (hasTechnique) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('TECHNIQUE', style: AppTypography.label),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          log.techniqueNameOverride!.toUpperCase(),
                          style: AppTypography.timestamp
                              .copyWith(color: AppColors.textPrimary),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          // ── Pre-session target ─────────────────────────────
          if (hasTarget) ...[
            const SizedBox(height: AppSpacing.sectionGap),
            FieldSection(
              label: 'PRE-SESSION TARGET',
              child:
                  Text(log.intention!, style: AppTypography.narrativeBody),
            ),
          ],

          // ── Excursion record ───────────────────────────────
          const SizedBox(height: AppSpacing.sectionGap),
          FieldSection(
            label: 'EXCURSION RECORD',
            child:
                Text(bodyText, style: AppTypography.narrativeBody),
          ),

          // ── Narrative ─────────────────────────────────────
          if (hasNarrative) ...[
            const SizedBox(height: AppSpacing.sectionGap),
            FieldSection(
              label: 'NARRATIVE',
              child: Text(log.experienceNarrative!,
                  style: AppTypography.narrativeBody),
            ),
          ],

          // ── Post-session reflection ────────────────────────
          if (hasReflection) ...[
            const SizedBox(height: AppSpacing.sectionGap),
            FieldSection(
              label: 'POST-SESSION REFLECTION',
              child: Text(log.postReflection!,
                  style: AppTypography.narrativeMuted),
            ),
          ],

          // ── Significance ──────────────────────────────────
          if (log.significanceRating != null) ...[
            const SizedBox(height: AppSpacing.sectionGap),
            FieldSection(
              label: 'SIGNIFICANCE',
              child: Row(
                children: List.generate(5, (i) {
                  final filled = i < log.significanceRating!;
                  return Container(
                    width: 18,
                    height: 10,
                    margin: const EdgeInsets.only(right: 3),
                    color: filled
                        ? AppColors.amber
                        : AppColors.borderStrong,
                  );
                }),
              ),
            ),
          ],

          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}
