import 'package:flutter/material.dart';

import '../../../../core/constants/tutorial_content.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/field_section.dart';

class FieldGuideScreen extends StatelessWidget {
  const FieldGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      appBar: AppBar(
        title: Text('FIELD GUIDE', style: AppTypography.heading),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.borderSubtle),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenH,
          vertical: AppSpacing.screenV,
        ),
        children: [
          const _GuideSection(
            label: 'PHASE SYSTEM',
            subtitle: TutorialContent.phaseSystemIntro,
            entries: [
              _GuideEntry('PHASE I', TutorialContent.phaseI),
              _GuideEntry('PHASE II', TutorialContent.phaseII),
              _GuideEntry('PHASE III', TutorialContent.phaseIII),
              _GuideEntry('PHASE IV', TutorialContent.phaseIV),
            ],
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          const _GuideSection(
            label: 'SESSION TYPES',
            subtitle: TutorialContent.sessionTypeIntro,
            entries: [
              _GuideEntry('DELIBERATE', TutorialContent.sessionDeliberate),
              _GuideEntry('AMBIENT', TutorialContent.sessionAmbient),
              _GuideEntry('BRIDGE', TutorialContent.sessionBridge),
            ],
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          const _GuideSection(
            label: 'ONSET',
            subtitle: TutorialContent.onsetIntro,
            entries: [
              _GuideEntry('TRACE', TutorialContent.onsetTrace),
              _GuideEntry('STRONG', TutorialContent.onsetStrong),
              _GuideEntry('SURGE', TutorialContent.onsetSurge),
            ],
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          const _GuideSection(
            label: 'FIELD TYPE',
            subtitle: TutorialContent.fieldTypeIntro,
            entries: [
              _GuideEntry('LOCAL', TutorialContent.fieldLocal),
              _GuideEntry('EXPANDED', TutorialContent.fieldExpanded),
              _GuideEntry('PARALLEL', TutorialContent.fieldParallel),
            ],
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          const _GuideSection(
            label: 'SESSION OUTCOME',
            subtitle: TutorialContent.outcomeIntro,
            entries: [
              _GuideEntry('CLEAN', TutorialContent.outcomeClean),
              _GuideEntry('PARTIAL', TutorialContent.outcomePartial),
              _GuideEntry('ATTEMPTED', TutorialContent.outcomeAttempted),
            ],
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          const _GuideSection(
            label: 'RITUAL PROTOCOL',
            subtitle: TutorialContent.ritualIntro,
            entries: [
              _GuideEntry('CLEAR', TutorialContent.ritualClear),
              _GuideEntry('TONE', TutorialContent.ritualTone),
              _GuideEntry('FIELD', TutorialContent.ritualField),
              _GuideEntry('AFFIRMATION', TutorialContent.ritualAffirmation),
              _GuideEntry('INTENTION', TutorialContent.ritualIntention),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          // Footer
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.cardPad,
              vertical: AppSpacing.md,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderSubtle),
            ),
            child: Text(
              'This system is yours. Adapt the language to match your experience.',
              style: AppTypography.bodyMuted,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Guide section
// ---------------------------------------------------------------------------

class _GuideSection extends StatelessWidget {
  const _GuideSection({
    required this.label,
    required this.entries,
    this.subtitle,
  });

  final String label;
  final String? subtitle;
  final List<_GuideEntry> entries;

  @override
  Widget build(BuildContext context) {
    return FieldSection(
      label: label,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (subtitle != null) ...[
            Text(subtitle!, style: AppTypography.bodyMuted),
            const SizedBox(height: AppSpacing.md),
            const Divider(height: 1, color: AppColors.borderSubtle),
            const SizedBox(height: AppSpacing.md),
          ],
          ...entries.map((e) => _EntryRow(entry: e)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Entry row
// ---------------------------------------------------------------------------

class _GuideEntry {
  const _GuideEntry(this.term, this.description);

  final String term;
  final String description;
}

class _EntryRow extends StatelessWidget {
  const _EntryRow({required this.entry});

  final _GuideEntry entry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 96,
            child: Text(entry.term, style: AppTypography.labelAmber),
          ),
          Expanded(
            child: Text(entry.description, style: AppTypography.bodyMuted),
          ),
        ],
      ),
    );
  }
}
