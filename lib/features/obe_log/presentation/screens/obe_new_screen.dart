import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/neu_surface.dart';
import '../../../../core/widgets/signal_loader.dart';
import '../../../../core/widgets/terminal_dialog.dart';
import '../../../../core/widgets/terminal_glyph.dart';
import '../../../../core/widgets/terminal_pickers.dart';
import '../../../../core/widgets/terminal_toast.dart';
import '../../data/repositories/obe_repository_impl.dart';
import '../bloc/obe_entry_cubit.dart';
import '../bloc/obe_log_bloc.dart';

class ObeNewScreen extends StatelessWidget {
  const ObeNewScreen({super.key, this.prefillDate});

  final String? prefillDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => ObeEntryCubit(
        repository: ObeRepositoryImpl(GetIt.instance<AppDatabase>()),
        obeLogBloc: ctx.read<ObeLogBloc>(),
      ),
      child: _ObeNewBody(prefillDate: prefillDate),
    );
  }
}

class _ObeNewBody extends StatefulWidget {
  const _ObeNewBody({this.prefillDate});
  final String? prefillDate;

  @override
  State<_ObeNewBody> createState() => _ObeNewBodyState();
}

class _ObeNewBodyState extends State<_ObeNewBody> {
  final _techniqueController = TextEditingController();
  final _targetController = TextEditingController();
  final _experienceController = TextEditingController();

  late DateTime _sessionDate;

  int _entryState = 0;       // 0=ATTEMPTED, 1=PARTIAL, 2=CLEAN
  int _sessionType = 0;       // 0=DELIBERATE, 1=AMBIENT, 2=BRIDGE
  int? _focusLevel;           // null=not recorded, 0..3
  bool _onsetReached = false;
  int? _onsetIntensity;       // null=not recorded, 1=TRACE..3=SURGE
  int? _fieldType;            // null=not recorded, 0=LOCAL..2=PARALLEL

  bool _detailsExpanded = false;

  static const _outcomeLabels = ['ATTEMPTED', 'PARTIAL', 'CLEAN'];
  static const _typeLabels = ['DELIBERATE', 'AMBIENT', 'BRIDGE'];
  static const _focusLabels = ['PHASE I', 'PHASE II', 'PHASE III', 'PHASE IV'];
  static const _intensityLabels = ['TRACE', 'STRONG', 'SURGE'];
  static const _fieldTypeLabels = ['LOCAL', 'EXPANDED', 'PARALLEL'];

  @override
  void initState() {
    super.initState();
    if (widget.prefillDate != null) {
      try {
        _sessionDate = DateTime.parse(widget.prefillDate!);
      } catch (_) {
        _sessionDate = DateTime.now();
      }
    } else {
      _sessionDate = DateTime.now();
    }
  }

  @override
  void dispose() {
    _techniqueController.dispose();
    _targetController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  String get _dateString {
    final d = _sessionDate;
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  Future<void> _pickDate() async {
    final picked = await showTerminalDatePicker(
      context: context,
      initialDate: _sessionDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _sessionDate = picked);
    }
  }

  void _save() {
    final description = _experienceController.text.trim();
    if (description.isEmpty) {
      TerminalToast.show(
        context,
        'EXPERIENCE NOTES REQUIRED',
        tone: ToastTone.alert,
      );
      return;
    }
    context.read<ObeEntryCubit>().saveObeLog(
          description: description,
          sessionDate: _sessionDate,
          entryState: _entryState,
          sessionType: _sessionType,
          techniqueNameOverride: _techniqueController.text.trim().isNotEmpty
              ? _techniqueController.text.trim()
              : null,
          intention: _targetController.text.trim().isNotEmpty
              ? _targetController.text.trim()
              : null,
          rundownDate: _dateString,
          focusLevel: _focusLevel,
          onsetReached: _onsetReached,
          onsetIntensity: _onsetReached ? _onsetIntensity : null,
          fieldType: _fieldType,
        );
  }

  bool get _hasDraft =>
      _experienceController.text.trim().isNotEmpty ||
      _techniqueController.text.trim().isNotEmpty ||
      _targetController.text.trim().isNotEmpty;

  Future<bool> _confirmDiscard() async {
    if (!_hasDraft) return true;
    return TerminalDialog.confirm(
      context: context,
      title: 'DISCARD DRAFT?',
      message: 'Session not saved. Closing now will lose this entry.',
      confirmLabel: 'DISCARD',
      cancelLabel: 'KEEP',
      destructive: true,
    );
  }

  String get _detailsSummary {
    final parts = <String>[
      _typeLabels[_sessionType],
      _outcomeLabels[_entryState],
    ];
    if (_focusLevel != null) parts.add(_focusLabels[_focusLevel!]);
    if (_onsetReached) {
      if (_onsetIntensity != null) {
        parts.add('ONSET · ${_intensityLabels[_onsetIntensity! - 1]}');
      } else {
        parts.add('ONSET');
      }
    }
    if (_fieldType != null) parts.add(_fieldTypeLabels[_fieldType!]);
    if (_techniqueController.text.trim().isNotEmpty) parts.add('TECH');
    if (_targetController.text.trim().isNotEmpty) parts.add('TARGET');
    return parts.join(' · ');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ObeEntryCubit, ObeEntryState>(
      listener: (context, state) {
        if (state is ObeEntrySaved) {
          Navigator.of(context).pop();
        } else if (state is ObeEntryError) {
          TerminalToast.show(
            context,
            'ERROR: ${state.message}',
            tone: ToastTone.alert,
          );
        }
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) async {
          if (didPop) return;
          final navigator = Navigator.of(context);
          final discard = await _confirmDiscard();
          if (!mounted) return;
          if (discard) navigator.pop();
        },
        child: Scaffold(
          backgroundColor: AppColors.backgroundBase,
          appBar: _buildAppBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Hero: experience notes.
                NeuInset(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                  child: TextField(
                    controller: _experienceController,
                    autofocus: true,
                    onChanged: (_) => setState(() {}),
                    maxLines: null,
                    minLines: 10,
                    cursorColor: AppColors.amber,
                    style: AppTypography.neuBody(),
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'describe what you found…',
                      hintStyle: AppTypography.neuHint(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                _DateTile(date: _dateString, onTap: _pickDate),
                const SizedBox(height: 16),

                _DetailsExpander(
                  expanded: _detailsExpanded,
                  summary: _detailsSummary,
                  onToggle: () => setState(
                      () => _detailsExpanded = !_detailsExpanded),
                ),

                if (_detailsExpanded) ...[
                  const SizedBox(height: 16),
                  NeuInset(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ChipSelector(
                          label: 'SESSION TYPE',
                          options: _typeLabels,
                          selected: _sessionType,
                          onSelect: (i) =>
                              setState(() => _sessionType = i),
                        ),
                        const SizedBox(height: 18),
                        _ChipSelector(
                          label: 'OUTCOME',
                          options: _outcomeLabels,
                          selected: _entryState,
                          onSelect: (i) => setState(() => _entryState = i),
                        ),
                        const SizedBox(height: 18),
                        _NullableChipSelector(
                          label: 'FOCUS LEVEL',
                          options: _focusLabels,
                          selected: _focusLevel,
                          onSelect: (i) => setState(() {
                            _focusLevel = i == _focusLevel ? null : i;
                          }),
                        ),
                        const SizedBox(height: 18),
                        _OnsetToggle(
                          reached: _onsetReached,
                          onChanged: (v) => setState(() {
                            _onsetReached = v;
                            if (!v) _onsetIntensity = null;
                          }),
                        ),
                        if (_onsetReached) ...[
                          const SizedBox(height: 18),
                          _NullableChipSelector(
                            label: 'ONSET INTENSITY',
                            options: _intensityLabels,
                            selected: _onsetIntensity != null
                                ? _onsetIntensity! - 1
                                : null,
                            onSelect: (i) => setState(() {
                              _onsetIntensity =
                                  (i + 1 == _onsetIntensity) ? null : i + 1;
                            }),
                          ),
                        ],
                        const SizedBox(height: 18),
                        _NullableChipSelector(
                          label: 'FIELD TYPE',
                          options: _fieldTypeLabels,
                          selected: _fieldType,
                          onSelect: (i) => setState(() {
                            _fieldType = i == _fieldType ? null : i;
                          }),
                        ),
                        const SizedBox(height: 22),
                        _LabeledNeuInput(
                          label: 'TECHNIQUE',
                          controller: _techniqueController,
                          hintText: '(optional)',
                          onChanged: (_) => setState(() {}),
                        ),
                        const SizedBox(height: 16),
                        _LabeledNeuInput(
                          label: 'PRE-SESSION TARGET',
                          controller: _targetController,
                          hintText: '(optional)',
                          onChanged: (_) => setState(() {}),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundBase,
      elevation: 0,
      leading: IconButton(
        icon: const TerminalGlyph(Glyphs.close,
            size: 16, color: AppColors.textSecondary),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      title: Text('LOG SESSION', style: AppTypography.heading),
      actions: [
        BlocBuilder<ObeEntryCubit, ObeEntryState>(
          builder: (context, state) {
            final saving = state is ObeEntrySaving;
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: TextButton(
                onPressed: saving ? null : _save,
                child: saving
                    ? const MiniSignalLoader()
                    : Text(
                        'SAVE',
                        style: AppTypography.label.copyWith(
                          color: AppColors.amber,
                        ),
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Sub-widgets
// ---------------------------------------------------------------------------

class _NeuLabel extends StatelessWidget {
  const _NeuLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        text,
        style: AppTypography.label.copyWith(color: AppColors.textSecondary),
      ),
    );
  }
}

class _DateTile extends StatelessWidget {
  const _DateTile({required this.date, required this.onTap});

  final String date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: NeuRaised(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Text(
              'SESSION DATE',
              style: AppTypography.label,
            ),
            const SizedBox(width: 12),
            Text(
              date,
              style: AppTypography.timestamp
                  .copyWith(color: AppColors.textPrimary),
            ),
            const Spacer(),
            const TerminalGlyph(
              Glyphs.calendar,
              size: 14,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsExpander extends StatelessWidget {
  const _DetailsExpander({
    required this.expanded,
    required this.summary,
    required this.onToggle,
  });

  final bool expanded;
  final String summary;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      behavior: HitTestBehavior.opaque,
      child: NeuRaised(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        intensity: 0.85,
        child: Row(
          children: [
            Text(
              'DETAILS',
              style: AppTypography.label.copyWith(
                color: expanded ? AppColors.amber : AppColors.textSecondary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                summary,
                style: AppTypography.timestamp
                    .copyWith(color: AppColors.textMuted),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Transform.rotate(
              angle: expanded ? 1.5708 : 0,
              child: const TerminalGlyph(
                Glyphs.chevronRight,
                size: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LabeledNeuInput extends StatelessWidget {
  const _LabeledNeuInput({
    required this.label,
    required this.controller,
    this.hintText,
    this.onChanged,
  });

  final String label;
  final TextEditingController controller;
  final String? hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _NeuLabel(label),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: AppColors.borderNormal,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.borderStrong.withValues(alpha: 0.6),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: AppTypography.body,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.transparent,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hintText,
              hintStyle: AppTypography.hint,
            ),
          ),
        ),
      ],
    );
  }
}

const _vocabDefs = <String, List<List<String>>>{
  'SESSION TYPE': [
    ['DELIBERATE', 'Sat down with the express intent to leave the body. Clock time set aside; technique chosen in advance.'],
    ['AMBIENT', 'A loose, drift-into-it session — laying down to nap, hypnagogic edges, no rigid technique.'],
    ['BRIDGE', 'Caught a transition (waking, falling asleep, brief rouse) and worked it into a session in-progress.'],
  ],
  'OUTCOME': [
    ['ATTEMPTED', "Set up the session but didn't reach onset or separation. Logged anyway — attempts are data."],
    ['PARTIAL', 'Onset occurred or some shift was felt; not a clean exit. Vibrations, paralysis, partial separation.'],
    ['CLEAN', 'Full separation from the body or clear non-local awareness. The thing happened.'],
  ],
  'FOCUS LEVEL': [
    ['PHASE I', 'Body relaxed, mind awake. Pre-onset baseline.'],
    ['PHASE II', 'Body asleep, mind awake. Vibrations, paralysis, sound effects begin.'],
    ['PHASE III', 'Separation imminent or beginning. Floating, sinking, lifting sensations.'],
    ['PHASE IV', 'Separation achieved. Operator is non-local.'],
  ],
  'ONSET INTENSITY': [
    ['TRACE', 'Faint vibrations or a subtle shift — barely above baseline.'],
    ['STRONG', 'Clear, unmistakable onset. Vibrations, body buzz, audible artifacts.'],
    ['SURGE', 'Overwhelming wave. Hard to remain neutral; easy to startle awake.'],
  ],
  'FIELD TYPE': [
    ['LOCAL', 'Awareness near or around the physical body — same room, immediate environment.'],
    ['EXPANDED', 'Familiar but expanded space — house, neighborhood, places known to the operator.'],
    ['PARALLEL', 'Non-local environments — unfamiliar settings, dreamlike but stable, other-than-here.'],
  ],
};

void _showDefinition(BuildContext context, String label) {
  final entries = _vocabDefs[label];
  if (entries == null) return;
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: AppColors.backgroundRaised,
    shape: const RoundedRectangleBorder(
      borderRadius:
          BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) => Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.heading),
          const SizedBox(height: 8),
          Text('// field reference', style: AppTypography.signalText),
          const SizedBox(height: AppSpacing.md),
          for (final entry in entries) ...[
            Text(entry[0], style: AppTypography.labelAmber),
            const SizedBox(height: 4),
            Text(entry[1], style: AppTypography.narrativeBody),
            const SizedBox(height: AppSpacing.md),
          ],
        ],
      ),
    ),
  );
}

class _LabelWithHelp extends StatelessWidget {
  const _LabelWithHelp({required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    final hasDef = _vocabDefs.containsKey(label);
    if (!hasDef) return _NeuLabel(label);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _NeuLabel(label),
        const SizedBox(width: 6),
        GestureDetector(
          onTap: () => _showDefinition(context, label),
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderStrong),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '?',
              style: AppTypography.label.copyWith(
                color: AppColors.signalGreenDim,
                letterSpacing: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ChipSelector extends StatelessWidget {
  const _ChipSelector({
    required this.label,
    required this.options,
    required this.selected,
    required this.onSelect,
  });

  final String label;
  final List<String> options;
  final int selected;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LabelWithHelp(label: label),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(options.length, (i) {
            final active = i == selected;
            return _SelectorChip(
              label: options[i],
              active: active,
              onTap: () => onSelect(i),
            );
          }),
        ),
      ],
    );
  }
}

class _NullableChipSelector extends StatelessWidget {
  const _NullableChipSelector({
    required this.label,
    required this.options,
    required this.selected,
    required this.onSelect,
  });

  final String label;
  final List<String> options;
  final int? selected;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LabelWithHelp(label: label),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(options.length, (i) {
            final active = i == selected;
            return _SelectorChip(
              label: options[i],
              active: active,
              onTap: () => onSelect(i),
            );
          }),
        ),
      ],
    );
  }
}

class _SelectorChip extends StatelessWidget {
  const _SelectorChip({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pad = const EdgeInsets.symmetric(horizontal: 14, vertical: 9);
    final child = Text(
      label,
      style: AppTypography.tag.copyWith(
        color: active ? AppColors.amber : AppColors.textSecondary,
        fontWeight: active ? FontWeight.w700 : FontWeight.w400,
      ),
    );
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: active
          ? NeuInset(
              padding: pad,
              radius: 10,
              accentBorder: true,
              child: child,
            )
          : NeuRaised(
              padding: pad,
              radius: 10,
              intensity: 0.7,
              child: child,
            ),
    );
  }
}

class _OnsetToggle extends StatelessWidget {
  const _OnsetToggle({required this.reached, required this.onChanged});

  final bool reached;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _NeuLabel('ONSET REACHED'),
        const Spacer(),
        _SelectorChip(
          label: reached ? 'YES' : 'NO',
          active: reached,
          onTap: () => onChanged(!reached),
        ),
      ],
    );
  }
}
