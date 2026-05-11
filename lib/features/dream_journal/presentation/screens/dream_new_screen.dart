import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/neu_surface.dart';
import '../../../../core/widgets/signal_loader.dart';
import '../../../../core/widgets/terminal_dialog.dart';
import '../../../../core/widgets/terminal_glyph.dart';
import '../../../../core/widgets/terminal_pickers.dart';
import '../../../../core/widgets/terminal_toast.dart';
import '../../data/repositories/dream_repository_impl.dart';
import '../bloc/dream_entry_cubit.dart';
import '../bloc/dream_journal_bloc.dart';
import '../widgets/character_picker_sheet.dart';
import '../widgets/tag_picker_sheet.dart';

class DreamNewScreen extends StatelessWidget {
  const DreamNewScreen({super.key, this.prefillDate});

  final String? prefillDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => DreamEntryCubit(
        repository: DreamRepositoryImpl(GetIt.instance<AppDatabase>()),
        dreamJournalBloc: ctx.read<DreamJournalBloc>(),
      ),
      child: _DreamNewBody(prefillDate: prefillDate),
    );
  }
}

class _DreamNewBody extends StatefulWidget {
  const _DreamNewBody({this.prefillDate});
  final String? prefillDate;

  @override
  State<_DreamNewBody> createState() => _DreamNewBodyState();
}

class _DreamNewBodyState extends State<_DreamNewBody> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  late DateTime _selectedDate;

  int _dreamType = 0;
  int _clarity = 3;
  bool _achievedLucidity = false;

  List<DreamTag> _selectedTags = [];
  List<DreamCharacter> _selectedCharacters = [];

  bool _detailsExpanded = false;

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
    if (widget.prefillDate != null) {
      try {
        _selectedDate = DateTime.parse(widget.prefillDate!);
      } catch (_) {
        _selectedDate = DateTime.now();
      }
    } else {
      _selectedDate = DateTime.now();
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
      return NeuColors.accent;
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
    final description = _descriptionController.text.trim();
    if (description.isEmpty) {
      TerminalToast.show(
        context,
        'DREAM ENTRY IS REQUIRED',
        tone: ToastTone.alert,
      );
      return;
    }
    var title = _titleController.text.trim();
    if (title.isEmpty) {
      final words = description.split(RegExp(r'\s+')).take(8).join(' ');
      title = words.length > 60 ? '${words.substring(0, 60)}...' : words;
    }
    context.read<DreamEntryCubit>().saveDream(
          title: title,
          description: description,
          rundownDate: _dateString,
          dreamType: _dreamType,
          clarity: _clarity - 1,
          achievedLucidity: _achievedLucidity,
          tagIds: _selectedTags.map((t) => t.id).toList(),
          characterIds: _selectedCharacters.map((c) => c.id).toList(),
        );
  }

  bool get _hasDraft =>
      _descriptionController.text.trim().isNotEmpty ||
      _titleController.text.trim().isNotEmpty ||
      _selectedTags.isNotEmpty ||
      _selectedCharacters.isNotEmpty;

  Future<bool> _confirmDiscard() async {
    if (!_hasDraft) return true;
    return TerminalDialog.confirm(
      context: context,
      title: 'DISCARD DRAFT?',
      message: 'Signal not saved. Closing now will lose this entry.',
      confirmLabel: 'DISCARD',
      cancelLabel: 'KEEP',
      destructive: true,
    );
  }

  /// One-line summary of current detail values — shown on the collapsed
  /// DETAILS row so the user can see what defaults are in play without
  /// expanding.
  String get _detailsSummary {
    final parts = <String>[
      _typeLabels[_dreamType],
      _clarityLabels[_clarity - 1],
    ];
    if (_dreamType == 1 && _achievedLucidity) parts.add('LUCID');
    if (_selectedTags.isNotEmpty) parts.add('${_selectedTags.length} TAG');
    if (_selectedCharacters.isNotEmpty) {
      parts.add('${_selectedCharacters.length} CHAR');
    }
    return parts.join(' · ');
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
          backgroundColor: NeuColors.surfaceBase,
          appBar: _buildAppBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Hero: dream entry field. Capture first, structure later.
                NeuInset(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                  child: TextField(
                    controller: _descriptionController,
                    autofocus: true,
                    onChanged: (_) => setState(() {}),
                    maxLines: null,
                    minLines: 10,
                    cursorColor: NeuColors.accent,
                    style: AppTypography.neuBody(),
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'what do you remember…',
                      hintStyle: AppTypography.neuHint(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Title — optional, secondary.
                NeuInset(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextField(
                    controller: _titleController,
                    style: AppTypography.neuTitle(),
                    cursorColor: NeuColors.accent,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'title (auto from first line)',
                      hintStyle: AppTypography.neuHint(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Date — small raised tile.
                _NeuDateTile(date: _dateString, onTap: _pickDate),
                const SizedBox(height: 16),

                // DETAILS expander — collapses Type/Clarity/Lucidity/Tags/Characters.
                _DetailsExpander(
                  expanded: _detailsExpanded,
                  summary: _detailsSummary,
                  onToggle: () =>
                      setState(() => _detailsExpanded = !_detailsExpanded),
                ),
                if (_detailsExpanded) ...[
                  const SizedBox(height: 16),
                  _DetailsPanel(
                    typeLabels: _typeLabels,
                    selectedType: _dreamType,
                    onTypeSelect: (i) => setState(() {
                      _dreamType = i;
                      if (i != 1) _achievedLucidity = false;
                    }),
                    clarity: _clarity,
                    clarityLabel: _clarityLabels[_clarity - 1],
                    onClaritySelect: (i) => setState(() => _clarity = i),
                    showLucidity: _dreamType == 1,
                    lucidityOn: _achievedLucidity,
                    onLucidityToggle: () => setState(
                        () => _achievedLucidity = !_achievedLucidity),
                    tags: _selectedTags,
                    onTagsAdd: () async {
                      final result = await showTagPicker(
                        context,
                        initialSelected: _selectedTags,
                      );
                      if (result != null) {
                        setState(() => _selectedTags = result);
                      }
                    },
                    onTagRemove: (t) =>
                        setState(() => _selectedTags.remove(t)),
                    parseTagColor: _parseTagColor,
                    characters: _selectedCharacters,
                    onCharactersAdd: () async {
                      final result = await showCharacterPicker(
                        context,
                        initialSelected: _selectedCharacters,
                      );
                      if (result != null && result.isNotEmpty) {
                        setState(() => _selectedCharacters = result);
                      }
                    },
                    onCharacterRemove: (c) =>
                        setState(() => _selectedCharacters.remove(c)),
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
      backgroundColor: NeuColors.surfaceBase,
      elevation: 0,
      leading: IconButton(
        icon: const TerminalGlyph(Glyphs.close,
            size: 16, color: NeuColors.inkSecondary),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      title: Text(
        'LOG DREAM',
        style: AppTypography.heading.copyWith(color: NeuColors.inkPrimary),
      ),
      actions: [
        BlocBuilder<DreamEntryCubit, DreamEntryState>(
          builder: (context, state) {
            final saving = state is DreamEntrySaving;
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: TextButton(
                onPressed: saving ? null : _save,
                child: saving
                    ? const MiniSignalLoader()
                    : Text(
                        'SAVE',
                        style: AppTypography.label.copyWith(
                          color: NeuColors.accent,
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
// Neu sub-widgets
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
        style: AppTypography.label.copyWith(color: NeuColors.inkSecondary),
      ),
    );
  }
}

class _NeuDateTile extends StatelessWidget {
  const _NeuDateTile({required this.date, required this.onTap});

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
              'DATE',
              style: AppTypography.label.copyWith(
                color: NeuColors.inkSecondary,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              date,
              style: AppTypography.timestamp.copyWith(
                color: NeuColors.inkPrimary,
              ),
            ),
            const Spacer(),
            const TerminalGlyph(
              Glyphs.calendar,
              size: 14,
              color: NeuColors.inkSecondary,
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
                color: expanded
                    ? NeuColors.accent
                    : NeuColors.inkSecondary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                summary,
                style: AppTypography.timestamp.copyWith(
                  color: NeuColors.inkMuted,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Transform.rotate(
              angle: expanded ? 1.5708 : 0, // 90° when expanded
              child: const TerminalGlyph(
                Glyphs.chevronRight,
                size: 12,
                color: NeuColors.inkSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsPanel extends StatelessWidget {
  const _DetailsPanel({
    required this.typeLabels,
    required this.selectedType,
    required this.onTypeSelect,
    required this.clarity,
    required this.clarityLabel,
    required this.onClaritySelect,
    required this.showLucidity,
    required this.lucidityOn,
    required this.onLucidityToggle,
    required this.tags,
    required this.onTagsAdd,
    required this.onTagRemove,
    required this.parseTagColor,
    required this.characters,
    required this.onCharactersAdd,
    required this.onCharacterRemove,
  });

  final List<String> typeLabels;
  final int selectedType;
  final ValueChanged<int> onTypeSelect;
  final int clarity;
  final String clarityLabel;
  final ValueChanged<int> onClaritySelect;
  final bool showLucidity;
  final bool lucidityOn;
  final VoidCallback onLucidityToggle;
  final List<DreamTag> tags;
  final VoidCallback onTagsAdd;
  final ValueChanged<DreamTag> onTagRemove;
  final Color Function(String hex) parseTagColor;
  final List<DreamCharacter> characters;
  final VoidCallback onCharactersAdd;
  final ValueChanged<DreamCharacter> onCharacterRemove;

  @override
  Widget build(BuildContext context) {
    return NeuInset(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _NeuLabel('TYPE'),
          const SizedBox(height: 10),
          _NeuTypeRow(
            labels: typeLabels,
            selected: selectedType,
            onSelect: onTypeSelect,
          ),
          const SizedBox(height: 18),
          const _NeuLabel('CLARITY'),
          const SizedBox(height: 10),
          _NeuClarityRow(
            clarity: clarity,
            label: clarityLabel,
            onSelect: onClaritySelect,
          ),
          if (showLucidity) ...[
            const SizedBox(height: 18),
            _NeuLuciditySwitch(on: lucidityOn, onToggle: onLucidityToggle),
          ],
          const SizedBox(height: 22),
          const _NeuLabel('TAGS'),
          const SizedBox(height: 10),
          _NeuChipsRow(
            chips: tags
                .map((t) => _NeuChip(
                      label: t.name.toUpperCase(),
                      color: parseTagColor(t.color),
                      onRemove: () => onTagRemove(t),
                    ))
                .toList(),
            addLabel: '+ ADD',
            onAdd: onTagsAdd,
          ),
          const SizedBox(height: 18),
          const _NeuLabel('CHARACTERS'),
          const SizedBox(height: 10),
          _NeuChipsRow(
            chips: characters
                .map((c) => _NeuChip(
                      label: c.name.toUpperCase(),
                      color: NeuColors.inkSecondary,
                      onRemove: () => onCharacterRemove(c),
                    ))
                .toList(),
            addLabel: '+ ADD',
            onAdd: onCharactersAdd,
          ),
        ],
      ),
    );
  }
}

class _NeuTypeRow extends StatelessWidget {
  const _NeuTypeRow({
    required this.labels,
    required this.selected,
    required this.onSelect,
  });

  final List<String> labels;
  final int selected;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(labels.length, (i) {
        final active = i == selected;
        final pad = const EdgeInsets.symmetric(horizontal: 14, vertical: 9);
        final child = Text(
          labels[i],
          style: AppTypography.tag.copyWith(
            color: active ? NeuColors.accent : NeuColors.inkSecondary,
            fontWeight: active ? FontWeight.w700 : FontWeight.w400,
          ),
        );
        return GestureDetector(
          onTap: () => onSelect(i),
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
      }),
    );
  }
}

class _NeuClarityRow extends StatelessWidget {
  const _NeuClarityRow({
    required this.clarity,
    required this.label,
    required this.onSelect,
  });

  final int clarity;
  final String label;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(5, (i) {
          final level = i + 1;
          final active = level <= clarity;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => onSelect(level),
              behavior: HitTestBehavior.opaque,
              child: SizedBox(
                width: 34,
                height: 34,
                child: active
                    ? NeuInset(
                        radius: 17,
                        accentBorder: true,
                        child: Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: NeuColors.accent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      )
                    : NeuRaised(
                        radius: 17,
                        intensity: 0.6,
                        child: const SizedBox.expand(),
                      ),
              ),
            ),
          );
        }),
        const SizedBox(width: 4),
        Text(
          label,
          style: AppTypography.label.copyWith(color: NeuColors.accent),
        ),
      ],
    );
  }
}

class _NeuLuciditySwitch extends StatelessWidget {
  const _NeuLuciditySwitch({required this.on, required this.onToggle});

  final bool on;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          const _NeuLabel('LUCIDITY'),
          const SizedBox(width: 12),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 180),
            child: on
                ? NeuInset(
                    key: const ValueKey('on'),
                    accentBorder: true,
                    radius: 10,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 7,
                    ),
                    child: Text(
                      'ACHIEVED',
                      style: AppTypography.tag.copyWith(
                        color: NeuColors.accent,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2.0,
                      ),
                    ),
                  )
                : NeuRaised(
                    key: const ValueKey('off'),
                    radius: 10,
                    intensity: 0.7,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 7,
                    ),
                    child: Text(
                      'TAP TO LOG',
                      style: AppTypography.tag.copyWith(
                        color: NeuColors.inkSecondary,
                        letterSpacing: 1.6,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _NeuChipsRow extends StatelessWidget {
  const _NeuChipsRow({
    required this.chips,
    required this.addLabel,
    required this.onAdd,
  });

  final List<Widget> chips;
  final String addLabel;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ...chips,
        GestureDetector(
          onTap: onAdd,
          behavior: HitTestBehavior.opaque,
          child: NeuRaised(
            radius: 8,
            intensity: 0.6,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Text(
              addLabel,
              style: AppTypography.tag.copyWith(color: NeuColors.inkSecondary),
            ),
          ),
        ),
      ],
    );
  }
}

class _NeuChip extends StatelessWidget {
  const _NeuChip({
    required this.label,
    required this.color,
    required this.onRemove,
  });

  final String label;
  final Color color;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return NeuRaised(
      radius: 8,
      intensity: 0.6,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 6, 6, 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: AppTypography.tag.copyWith(color: color),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onRemove,
            behavior: HitTestBehavior.opaque,
            child: const SizedBox(
              width: 30,
              height: 30,
              child: Center(
                child: TerminalGlyph(Glyphs.close,
                    size: 11, color: NeuColors.inkMuted),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
