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
import '../../data/repositories/dream_repository_impl.dart';
import '../bloc/dream_entry_cubit.dart';
import '../bloc/dream_journal_bloc.dart';
import '../widgets/character_picker_sheet.dart';
import '../widgets/tag_picker_sheet.dart';

class DreamEditScreen extends StatelessWidget {
  const DreamEditScreen({super.key, required this.dreamId});

  final int dreamId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => DreamEntryCubit(
        repository: DreamRepositoryImpl(GetIt.instance<AppDatabase>()),
        dreamJournalBloc: ctx.read<DreamJournalBloc>(),
      ),
      child: _DreamEditBody(dreamId: dreamId),
    );
  }
}

// ---------------------------------------------------------------------------
// Body
// ---------------------------------------------------------------------------

class _DreamEditBody extends StatefulWidget {
  const _DreamEditBody({required this.dreamId});

  final int dreamId;

  @override
  State<_DreamEditBody> createState() => _DreamEditBodyState();
}

class _DreamEditBodyState extends State<_DreamEditBody> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  late DateTime _selectedDate;

  int _dreamType = 0;
  int _clarity = 3;
  bool _achievedLucidity = false;

  List<DreamTag> _selectedTags = [];
  List<DreamCharacter> _selectedCharacters = [];

  bool _loading = true;
  String? _loadError;

  static const _typeLabels = ['NORMAL', 'LUCID', 'RECURRING', 'NIGHTMARE'];

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
    _selectedDate = DateTime.now();
    _loadDream();
  }

  Future<void> _loadDream() async {
    try {
      final db = GetIt.instance<AppDatabase>();
      final result = await db.dreamDao.getDreamWithEntities(widget.dreamId);
      if (result == null) {
        setState(() {
          _loading = false;
          _loadError = 'DREAM NOT FOUND';
        });
        return;
      }
      final dream = result.dream;
      _titleController.text = dream.title;
      _descriptionController.text = dream.description;
      if (dream.rundownDate != null) {
        try {
          _selectedDate = DateTime.parse(dream.rundownDate!);
        } catch (_) {
          _selectedDate = dream.createdAt;
        }
      } else {
        _selectedDate = dream.createdAt;
      }
      _dreamType = dream.dreamType;
      // DB stores 0-4, UI uses 1-5
      _clarity = dream.clarity + 1;
      _achievedLucidity = dream.achievedLucidity;
      _selectedTags = result.tags;
      _selectedCharacters = result.characters;
      setState(() => _loading = false);
    } catch (e) {
      setState(() {
        _loading = false;
        _loadError = e.toString();
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Color _parseTagColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return AppColors.amber;
    }
  }

  String get _dateString {
    final d = _selectedDate;
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  Future<void> _pickDate() async {
    final picked = await showTerminalDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _save() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    if (title.isEmpty || description.isEmpty) {
      TerminalToast.show(
        context,
        'TITLE AND ENTRY REQUIRED',
        tone: ToastTone.alert,
      );
      return;
    }
    context.read<DreamEntryCubit>().updateDream(
          dreamId: widget.dreamId,
          title: title,
          description: description,
          rundownDate: _dateString,
          dreamType: _dreamType,
          clarity: _clarity - 1, // convert 1-5 UI to 0-4 DB
          achievedLucidity: _achievedLucidity,
          tagIds: _selectedTags.map((t) => t.id).toList(),
          characterIds: _selectedCharacters.map((c) => c.id).toList(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DreamEntryCubit, DreamEntryState>(
      listener: (context, state) {
        if (state is DreamEntrySaved) {
          Navigator.of(context).pop();
        } else if (state is DreamEntryError) {
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
        child: Text(_loadError!, style: AppTypography.body),
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
          _DateSection(
            dateString: _dateString,
            onTap: _pickDate,
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          _LabeledField(
            label: 'TITLE',
            child: _BorderedTextField(
              controller: _titleController,
              hintText: '---',
              maxLines: 1,
            ),
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          _TypeSection(
            labels: _typeLabels,
            selected: _dreamType,
            onSelect: (i) => setState(() {
              _dreamType = i;
              if (i != 1) _achievedLucidity = false;
            }),
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          _ClaritySection(
            clarity: _clarity,
            clarityLabel: _clarityLabels[_clarity - 1],
            onSelect: (i) => setState(() => _clarity = i),
          ),
          if (_dreamType == 1) ...[
            const SizedBox(height: AppSpacing.sectionGap),
            _LucidToggle(
              value: _achievedLucidity,
              onChanged: (v) => setState(() => _achievedLucidity = v),
            ),
          ],
          const SizedBox(height: AppSpacing.sectionGap),
          _LabeledField(
            label: 'DREAM ENTRY',
            child: _BorderedTextField(
              controller: _descriptionController,
              hintText: '---',
              maxLines: null,
              minLines: 8,
            ),
          ),
          const SizedBox(height: AppSpacing.sectionGap),

          // Tags
          _EntitySection(
            label: 'TAGS',
            chips: _selectedTags
                .map((t) => _EntityChip(
                      label: t.name.toUpperCase(),
                      color: _parseTagColor(t.color),
                      onRemove: () =>
                          setState(() => _selectedTags.remove(t)),
                    ))
                .toList(),
            onAdd: () async {
              final result = await showTagPicker(
                context,
                initialSelected: _selectedTags,
              );
              if (result != null) {
                setState(() => _selectedTags = result);
              }
            },
          ),
          const SizedBox(height: AppSpacing.sectionGap),

          // Characters
          _EntitySection(
            label: 'CHARACTERS',
            chips: _selectedCharacters
                .map((c) => _EntityChip(
                      label: c.name.toUpperCase(),
                      color: AppColors.statusSleep,
                      onRemove: () =>
                          setState(() => _selectedCharacters.remove(c)),
                    ))
                .toList(),
            onAdd: () async {
              final result = await showCharacterPicker(
                context,
                initialSelected: _selectedCharacters,
              );
              if (result != null && result.isNotEmpty) {
                setState(() => _selectedCharacters = result);
              }
            },
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
      title: Text('EDIT DREAM', style: AppTypography.heading),
      actions: [
        BlocBuilder<DreamEntryCubit, DreamEntryState>(
          builder: (context, state) {
            final saving = state is DreamEntrySaving;
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
// Sub-widgets (duplicated from dream_new_screen since they are private)
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
        color: AppColors.borderNormal,
        border: Border.all(color: AppColors.borderStrong.withValues(alpha: 0.6)),
        borderRadius: BorderRadius.circular(12),
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
          filled: true,
          fillColor: Colors.transparent,
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
        Text('DATE', style: AppTypography.label),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.cardPad,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: AppColors.borderNormal,
              border: Border.all(color: AppColors.borderStrong.withValues(alpha: 0.6)),
              borderRadius: BorderRadius.circular(10),
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

class _TypeSection extends StatelessWidget {
  const _TypeSection({
    required this.labels,
    required this.selected,
    required this.onSelect,
  });

  final List<String> labels;
  final int selected;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('DREAM TYPE', style: AppTypography.label),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: List.generate(labels.length, (i) {
            final active = i == selected;
            return GestureDetector(
              onTap: () => onSelect(i),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                decoration: BoxDecoration(
                  color: active ? AppColors.amberMuted : Colors.transparent,
                  border: Border.all(
                    color: active ? AppColors.amber : AppColors.borderSubtle,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  labels[i],
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

class _ClaritySection extends StatelessWidget {
  const _ClaritySection({
    required this.clarity,
    required this.clarityLabel,
    required this.onSelect,
  });

  final int clarity;
  final String clarityLabel;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('CLARITY', style: AppTypography.label),
            const SizedBox(width: 8),
            Text(clarityLabel,
                style: AppTypography.label.copyWith(color: AppColors.amber)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(5, (i) {
            final level = i + 1;
            final active = level <= clarity;
            return GestureDetector(
              onTap: () => onSelect(level),
              child: Container(
                width: 44,
                height: 32,
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: active ? AppColors.amber : AppColors.borderStrong,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _LucidToggle extends StatelessWidget {
  const _LucidToggle({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('ACHIEVED LUCIDITY', style: AppTypography.label),
        const Spacer(),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: AppColors.amber,
          inactiveThumbColor: AppColors.borderStrong,
          inactiveTrackColor: AppColors.backgroundDeep,
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Entity section (tags / characters)
// ---------------------------------------------------------------------------

class _EntitySection extends StatelessWidget {
  const _EntitySection({
    required this.label,
    required this.chips,
    required this.onAdd,
  });

  final String label;
  final List<Widget> chips;
  final VoidCallback onAdd;

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
          children: [
            ...chips,
            GestureDetector(
              onTap: onAdd,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderStrong),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '+ ADD',
                  style:
                      AppTypography.tag.copyWith(color: AppColors.textMuted),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _EntityChip extends StatelessWidget {
  const _EntityChip({
    required this.label,
    required this.color,
    required this.onRemove,
  });

  final String label;
  final Color color;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 4, 4, 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration:
                      BoxDecoration(color: color, shape: BoxShape.circle),
                ),
                const SizedBox(width: 6),
                Text(label, style: AppTypography.tag.copyWith(color: color)),
              ],
            ),
          ),
          GestureDetector(
            onTap: onRemove,
            behavior: HitTestBehavior.opaque,
            child: const SizedBox(
              width: 32,
              height: 32,
              child: Center(
                child: TerminalGlyph(Glyphs.close,
                    size: 12, color: AppColors.textMuted),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
