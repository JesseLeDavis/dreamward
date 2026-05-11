import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/dream_dao.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/data_tag.dart';
import '../../../../core/widgets/field_section.dart';
import '../../../../core/widgets/signal_loader.dart';
import '../../../../core/widgets/terminal_glyph.dart';

class DreamDetailScreen extends StatefulWidget {
  const DreamDetailScreen({super.key, required this.dreamId});

  final int dreamId;

  @override
  State<DreamDetailScreen> createState() => _DreamDetailScreenState();
}

class _DreamDetailScreenState extends State<DreamDetailScreen> {
  DreamWithEntities? _data;
  bool _loading = true;
  String? _error;

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

  static const _clarityLabels = [
    'FRAGMENTARY',
    'PARTIAL',
    'CLEAR',
    'VIVID',
    'CRYSTAL',
  ];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final db = GetIt.instance<AppDatabase>();
      final result = await db.dreamDao.getDreamWithEntities(widget.dreamId);
      if (!mounted) return;
      if (result == null) {
        setState(() {
          _loading = false;
          _error = 'DREAM NOT FOUND.';
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

  Color _parseTagColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return AppColors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDeep,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: AppColors.textSecondary, size: 18),
        title: Text('DREAM LOG', style: AppTypography.heading),
        actions: [
          if (!_loading && _data != null)
            IconButton(
              icon: const TerminalGlyph(Glyphs.edit, size: 16, color: AppColors.amber),
              onPressed: () async {
                await context.pushNamed(
                  AppRoutes.dreamEdit,
                  pathParameters: {'dreamId': widget.dreamId.toString()},
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
      return const Center(child: SignalLoader());
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
    final dream = data.dream;

    // Date label
    final dateLabel = dream.rundownDate ??
        () {
          final d = dream.createdAt;
          return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
        }();

    final typeLabel = _typeLabels[dream.dreamType] ?? 'NORMAL';
    final tagColor = _typeColors[dream.dreamType] ?? AppColors.tagFragmented;
    // clarity: 0-4 in DB → display 1-5 filled segments
    final clarityLabel = _clarityLabels[dream.clarity.clamp(0, 4)];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenH,
        vertical: AppSpacing.screenV,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Title ──────────────────────────────────────────
          Text(dream.title.toUpperCase(), style: AppTypography.heading),
          const SizedBox(height: AppSpacing.sectionGap),

          // ── Meta row: date / type / clarity ────────────────
          FieldSection(
            label: 'SIGNAL META',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date + type row
                Row(
                  children: [
                    Text(dateLabel, style: AppTypography.timestamp),
                    const SizedBox(width: 10),
                    Container(width: 1, height: 10, color: AppColors.borderStrong),
                    const SizedBox(width: 10),
                    DataTag(label: typeLabel, color: tagColor),
                    if (dream.achievedLucidity) ...[
                      const SizedBox(width: 8),
                      DataTag(
                        label: 'LUCIDITY',
                        color: AppColors.amber,
                        filled: true,
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 10),
                // Clarity bar
                Row(
                  children: [
                    Text('CLARITY', style: AppTypography.label),
                    const SizedBox(width: 8),
                    Text(clarityLabel,
                        style: AppTypography.label.copyWith(
                            color: AppColors.amber)),
                    const Spacer(),
                    _ClarityBar(clarity: dream.clarity),
                  ],
                ),
                if (dream.continuationChainId != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('CHAIN', style: AppTypography.labelAmber),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          dream.continuationChainId!,
                          style: AppTypography.timestamp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          // ── Tags ───────────────────────────────────────────
          if (data.tags.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sectionGap),
            FieldSection(
              label: 'TAGS',
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: data.tags.map((t) {
                  final color = _parseTagColor(t.color);
                  return DataTag(label: t.name, color: color);
                }).toList(),
              ),
            ),
          ],

          // ── Characters ─────────────────────────────────────
          if (data.characters.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sectionGap),
            FieldSection(
              label: 'CHARACTERS',
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: data.characters
                    .map((c) =>
                        DataTag(label: c.name, color: AppColors.statusSleep))
                    .toList(),
              ),
            ),
          ],

          // ── Places ─────────────────────────────────────────
          if (data.places.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sectionGap),
            FieldSection(
              label: 'LOCATIONS',
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: data.places
                    .map((p) => DataTag(
                          label: p.name,
                          color: AppColors.greenDim,
                        ))
                    .toList(),
              ),
            ),
          ],

          // ── Signal Record (description) ────────────────────
          const SizedBox(height: AppSpacing.sectionGap),
          FieldSection(
            label: 'SIGNAL RECORD',
            child: Text(dream.description, style: AppTypography.narrativeBody),
          ),

          // ── Summary ────────────────────────────────────────
          if (dream.summary != null && dream.summary!.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sectionGap),
            FieldSection(
              label: 'SUMMARY',
              child: Text(dream.summary!, style: AppTypography.narrativeMuted),
            ),
          ],

          // ── Lucid detail ───────────────────────────────────
          if (dream.achievedLucidity) ...[
            const SizedBox(height: AppSpacing.sectionGap),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.cardPad,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: AppColors.amberMuted,
                border: Border.all(color: AppColors.amberDim),
              ),
              child: Row(
                children: [
                  const TerminalGlyph(Glyphs.bolt, size: 14, color: AppColors.amber, weight: FontWeight.w700),
                  const SizedBox(width: 8),
                  Text(
                    'LUCIDITY ACHIEVED',
                    style: AppTypography.labelAmber,
                  ),
                  if (dream.lucidDurationEstimateMinutes != null) ...[
                    const SizedBox(width: 10),
                    Container(width: 1, height: 10, color: AppColors.amberDim),
                    const SizedBox(width: 10),
                    Text(
                      '~${dream.lucidDurationEstimateMinutes} MIN',
                      style: AppTypography.timestamp
                          .copyWith(color: AppColors.amberDim),
                    ),
                  ],
                ],
              ),
            ),
          ],

          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Clarity bar — mirrors the one in dreams_screen.dart
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
