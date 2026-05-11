import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/signal_loader.dart';
import '../../../../core/widgets/terminal_glyph.dart';
import '../../../../core/widgets/terminal_pickers.dart';
import '../../../../core/widgets/terminal_toast.dart';
import '../../data/repositories/obe_repository_impl.dart';
import '../bloc/obe_entry_cubit.dart';
import '../bloc/obe_log_bloc.dart';

class ObeEditScreen extends StatelessWidget {
  const ObeEditScreen({super.key, required this.obeId});

  final int obeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => ObeEntryCubit(
        repository: ObeRepositoryImpl(GetIt.instance<AppDatabase>()),
        obeLogBloc: ctx.read<ObeLogBloc>(),
      ),
      child: _ObeEditBody(obeId: obeId),
    );
  }
}

// ---------------------------------------------------------------------------
// Body
// ---------------------------------------------------------------------------

class _ObeEditBody extends StatefulWidget {
  const _ObeEditBody({required this.obeId});

  final int obeId;

  @override
  State<_ObeEditBody> createState() => _ObeEditBodyState();
}

class _ObeEditBodyState extends State<_ObeEditBody> {
  final _techniqueController = TextEditingController();
  final _targetController = TextEditingController();
  final _experienceController = TextEditingController();

  late DateTime _sessionDate;

  // 0=ATTEMPTED, 1=PARTIAL, 2=CLEAN
  int _entryState = 0;

  // 0=DELIBERATE, 1=AMBIENT, 2=BRIDGE
  int _sessionType = 0;

  // null = not recorded; 0=PHASE I, 1=PHASE II, 2=PHASE III, 3=PHASE IV
  int? _focusLevel;

  // onset
  bool _onsetReached = false;

  // null = not recorded; 1=TRACE, 2=STRONG, 3=SURGE (only valid when _onsetReached)
  int? _onsetIntensity;

  // null = not recorded; 0=LOCAL, 1=EXPANDED, 2=PARALLEL
  int? _fieldType;

  bool _loading = true;
  String? _loadError;

  static const _outcomeLabels = ['ATTEMPTED', 'PARTIAL', 'CLEAN'];
  static const _typeLabels = ['DELIBERATE', 'AMBIENT', 'BRIDGE'];
  static const _focusLabels = ['PHASE I', 'PHASE II', 'PHASE III', 'PHASE IV'];
  static const _intensityLabels = ['TRACE', 'STRONG', 'SURGE'];
  static const _fieldTypeLabels = ['LOCAL', 'EXPANDED', 'PARALLEL'];

  @override
  void initState() {
    super.initState();
    _sessionDate = DateTime.now();
    _loadObeLog();
  }

  Future<void> _loadObeLog() async {
    try {
      final db = GetIt.instance<AppDatabase>();
      final details = await db.obeDao.getObeLogWithDetails(widget.obeId);
      if (details == null) {
        setState(() {
          _loading = false;
          _loadError = 'SESSION NOT FOUND.';
        });
        return;
      }

      final log = details.log;

      setState(() {
        _sessionDate = log.sessionDate;
        _entryState = log.entryState;
        _sessionType = log.sessionType;
        _focusLevel = log.focusLevel;
        _onsetReached = log.onsetReached;
        _onsetIntensity = log.onsetIntensity;
        _fieldType = log.fieldType;

        _techniqueController.text = log.techniqueNameOverride ?? '';
        _targetController.text = log.intention ?? '';
        _experienceController.text = log.description;

        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _loadError = e.toString();
      });
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

    context.read<ObeEntryCubit>().updateObeLog(
          obeLogId: widget.obeId,
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
      child: Scaffold(
        backgroundColor: AppColors.backgroundBase,
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: SignalLoader());
    }
    if (_loadError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenH),
          child: Text(_loadError!, style: AppTypography.body),
        ),
      );
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenH,
        vertical: AppSpacing.screenV,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date
          _DateSection(dateString: _dateString, onTap: _pickDate),
          const SizedBox(height: AppSpacing.sectionGap),

          // Technique
          _LabeledField(
            label: 'TECHNIQUE',
            child: _BorderedTextField(
              controller: _techniqueController,
              hintText: '---',
              maxLines: 1,
            ),
          ),
          const SizedBox(height: AppSpacing.sectionGap),

          // Session type
          _ChipSelector(
            label: 'SESSION TYPE',
            options: _typeLabels,
            selected: _sessionType,
            onSelect: (i) => setState(() => _sessionType = i),
          ),
          const SizedBox(height: AppSpacing.sectionGap),

          // Outcome
          _ChipSelector(
            label: 'OUTCOME',
            options: _outcomeLabels,
            selected: _entryState,
            onSelect: (i) => setState(() => _entryState = i),
          ),
          const SizedBox(height: AppSpacing.sectionGap),

          // Focus Level
          _NullableChipSelector(
            label: 'FOCUS LEVEL',
            options: _focusLabels,
            selected: _focusLevel,
            onSelect: (i) => setState(() => _focusLevel = i),
          ),
          const SizedBox(height: AppSpacing.sectionGap),

          // Onset reached toggle
          _OnsetToggle(
            reached: _onsetReached,
            onChanged: (v) => setState(() {
              _onsetReached = v;
              if (!v) _onsetIntensity = null;
            }),
          ),
          const SizedBox(height: AppSpacing.sectionGap),

          // Onset intensity (only when onset reached)
          if (_onsetReached) ...[
            _NullableChipSelector(
              label: 'ONSET INTENSITY',
              options: _intensityLabels,
              selected: _onsetIntensity != null
                  ? _onsetIntensity! - 1
                  : null,
              onSelect: (i) =>
                  setState(() => _onsetIntensity = i + 1),
            ),
            const SizedBox(height: AppSpacing.sectionGap),
          ],

          // Field type
          _NullableChipSelector(
            label: 'FIELD TYPE',
            options: _fieldTypeLabels,
            selected: _fieldType,
            onSelect: (i) => setState(() => _fieldType = i),
          ),
          const SizedBox(height: AppSpacing.sectionGap),

          // Pre-session target
          _LabeledField(
            label: 'PRE-SESSION TARGET',
            child: _BorderedTextField(
              controller: _targetController,
              hintText: '---',
              maxLines: 1,
            ),
          ),
          const SizedBox(height: AppSpacing.sectionGap),

          // Experience
          _LabeledField(
            label: 'EXPERIENCE NOTES',
            child: _BorderedTextField(
              controller: _experienceController,
              hintText: '---',
              maxLines: null,
              minLines: 8,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundDeep,
      leading: IconButton(
        icon: const TerminalGlyph(Glyphs.close, size: 16, color: AppColors.textSecondary),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text('EDIT SESSION', style: AppTypography.heading),
      actions: [
        BlocBuilder<ObeEntryCubit, ObeEntryState>(
          builder: (context, state) {
            final saving = state is ObeEntrySaving;
            return TextButton(
              onPressed: saving || _loading ? null : _save,
              child: saving
                  ? const MiniSignalLoader()
                  : Text(
                      'SAVE',
                      style: AppTypography.label.copyWith(
                        color: AppColors.amber,
                      ),
                    ),
            );
          },
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
// Shared sub-widgets (same as obe_new_screen.dart)
// ---------------------------------------------------------------------------

class _LabeledField extends StatelessWidget {
  const _LabeledField({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.label),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}

class _BorderedTextField extends StatelessWidget {
  const _BorderedTextField({
    required this.controller,
    this.hintText,
    this.maxLines = 1,
    this.minLines,
  });

  final TextEditingController controller;
  final String? hintText;
  final int? maxLines;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundDeep,
        border: Border.all(color: AppColors.borderNormal),
      ),
      child: TextField(
        controller: controller,
        style: AppTypography.body,
        maxLines: maxLines,
        minLines: minLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTypography.hint,
          contentPadding: const EdgeInsets.all(AppSpacing.cardPad),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class _DateSection extends StatelessWidget {
  const _DateSection({required this.dateString, required this.onTap});

  final String dateString;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SESSION DATE', style: AppTypography.label),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.cardPad,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: AppColors.backgroundDeep,
              border: Border.all(color: AppColors.borderNormal),
            ),
            child: Row(
              children: [
                Text(dateString, style: AppTypography.timestamp),
                const Spacer(),
                const TerminalGlyph(
                  Glyphs.calendar,
                  size: 12,
                  color: AppColors.textMuted,
                ),
              ],
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
        Text(label, style: AppTypography.label),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: List.generate(options.length, (i) {
            final active = i == selected;
            return GestureDetector(
              onTap: () => onSelect(i),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: active ? AppColors.amberMuted : Colors.transparent,
                  border: Border.all(
                    color:
                        active ? AppColors.amber : AppColors.borderSubtle,
                  ),
                ),
                child: Text(
                  options[i],
                  style: AppTypography.tag.copyWith(
                    color: active ? AppColors.amber : AppColors.textMuted,
                  ),
                ),
              ),
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
        Text(label, style: AppTypography.label),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: List.generate(options.length, (i) {
            final active = i == selected;
            return GestureDetector(
              onTap: () => onSelect(i),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: active ? AppColors.amberMuted : Colors.transparent,
                  border: Border.all(
                    color: active ? AppColors.amber : AppColors.borderSubtle,
                  ),
                ),
                child: Text(
                  options[i],
                  style: AppTypography.tag.copyWith(
                    color: active ? AppColors.amber : AppColors.textMuted,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
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
        Text('ONSET REACHED', style: AppTypography.label),
        const Spacer(),
        GestureDetector(
          onTap: () => onChanged(!reached),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: reached ? AppColors.amberMuted : Colors.transparent,
              border: Border.all(
                color: reached ? AppColors.amber : AppColors.borderSubtle,
              ),
            ),
            child: Text(
              reached ? 'YES' : 'NO',
              style: AppTypography.tag.copyWith(
                color: reached ? AppColors.amber : AppColors.textMuted,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
