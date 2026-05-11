import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/paper_surface.dart';
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

// ---------------------------------------------------------------------------
// Body
// ---------------------------------------------------------------------------

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
      return PaperColors.inkAccent;
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
          backgroundColor: AppColors.backgroundBase,
          appBar: _buildAppBar(),
          body: PaperPage(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _DateStrip(
                    dateString: _dateString,
                    onTap: _pickDate,
                  ),
                  const SizedBox(height: 20),

                  // Hero entry field — ruled notebook page.
                  _NotebookEntryField(
                    controller: _descriptionController,
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 24),

                  // Title — below the entry, like a caption.
                  _TitleField(controller: _titleController),
                  const SizedBox(height: 28),

                  // Metadata: type underline + clarity dots
                  _NotebookLabel('TYPE'),
                  const SizedBox(height: 8),
                  _TypeUnderlineRow(
                    labels: _typeLabels,
                    selected: _dreamType,
                    onSelect: (i) => setState(() {
                      _dreamType = i;
                      if (i != 1) _achievedLucidity = false;
                    }),
                  ),
                  const SizedBox(height: 22),

                  _NotebookLabel('CLARITY'),
                  const SizedBox(height: 8),
                  _ClarityDotsRow(
                    clarity: _clarity,
                    label: _clarityLabels[_clarity - 1],
                    onSelect: (i) => setState(() => _clarity = i),
                  ),

                  // Lucidity stamp — only for LUCID type.
                  if (_dreamType == 1) ...[
                    const SizedBox(height: 22),
                    _LucidityStampToggle(
                      stamped: _achievedLucidity,
                      onToggle: () => setState(
                          () => _achievedLucidity = !_achievedLucidity),
                    ),
                  ],

                  const SizedBox(height: 28),
                  _NotebookLabel('TAGS'),
                  const SizedBox(height: 8),
                  _MarginNoteChips(
                    chips: _selectedTags
                        .map((t) => _InkChip(
                              label: t.name.toUpperCase(),
                              color: _parseTagColor(t.color),
                              onRemove: () =>
                                  setState(() => _selectedTags.remove(t)),
                            ))
                        .toList(),
                    addLabel: '+ tag',
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

                  const SizedBox(height: 22),
                  _NotebookLabel('CHARACTERS'),
                  const SizedBox(height: 8),
                  _MarginNoteChips(
                    chips: _selectedCharacters
                        .map((c) => _InkChip(
                              label: c.name.toUpperCase(),
                              color: PaperColors.inkSecondary,
                              onRemove: () => setState(
                                  () => _selectedCharacters.remove(c)),
                            ))
                        .toList(),
                    addLabel: '+ character',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundDeep,
      leading: IconButton(
        icon: const TerminalGlyph(Glyphs.close,
            size: 16, color: AppColors.textSecondary),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      title: Text('LOG DREAM', style: AppTypography.heading),
      actions: [
        BlocBuilder<DreamEntryCubit, DreamEntryState>(
          builder: (context, state) {
            final saving = state is DreamEntrySaving;
            return TextButton(
              onPressed: saving ? null : _save,
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
// Notebook sub-widgets
// ---------------------------------------------------------------------------

class _NotebookLabel extends StatelessWidget {
  const _NotebookLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.label.copyWith(
        color: PaperColors.inkSecondary,
      ),
    );
  }
}

class _DateStrip extends StatelessWidget {
  const _DateStrip({required this.dateString, required this.onTap});

  final String dateString;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const _NotebookLabel('DATE'),
              const SizedBox(width: 10),
              Text(
                dateString,
                style: AppTypography.timestamp.copyWith(
                  color: PaperColors.inkPrimary,
                ),
              ),
              const Spacer(),
              const TerminalGlyph(
                Glyphs.calendar,
                size: 12,
                color: PaperColors.inkSecondary,
              ),
            ],
          ),
          const SizedBox(height: 6),
          const PaperRule(),
        ],
      ),
    );
  }
}

/// The hero: a ruled notebook page that grows as the user writes.
class _NotebookEntryField extends StatelessWidget {
  const _NotebookEntryField({
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  static const double _lineHeight = 28;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          painter: _RuledLinesPainter(lineHeight: _lineHeight),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: _lineHeight * 10),
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              maxLines: null,
              minLines: 10,
              cursorColor: PaperColors.inkAccent,
              style: AppTypography.notebookBody(),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'what do you remember…',
                hintStyle: AppTypography.notebookHint(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _RuledLinesPainter extends CustomPainter {
  const _RuledLinesPainter({required this.lineHeight});
  final double lineHeight;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = PaperColors.ruleLine
      ..strokeWidth = 1;
    var y = lineHeight;
    while (y < size.height) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
      y += lineHeight;
    }
  }

  @override
  bool shouldRepaint(_RuledLinesPainter oldDelegate) =>
      oldDelegate.lineHeight != lineHeight;
}

class _TitleField extends StatelessWidget {
  const _TitleField({required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(height: 1, color: PaperColors.paperFold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'titled',
                style: AppTypography.notebookHint(
                  color: PaperColors.inkSecondary,
                ),
              ),
            ),
            Expanded(
              child: Container(height: 1, color: PaperColors.paperFold),
            ),
          ],
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          style: AppTypography.notebookTitle(),
          textAlign: TextAlign.center,
          cursorColor: PaperColors.inkAccent,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: '(auto from first line)',
            hintStyle: AppTypography.notebookHint().copyWith(fontSize: 14),
          ),
        ),
      ],
    );
  }
}

class _TypeUnderlineRow extends StatelessWidget {
  const _TypeUnderlineRow({
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
      spacing: 18,
      runSpacing: 10,
      children: List.generate(labels.length, (i) {
        final active = i == selected;
        return GestureDetector(
          onTap: () => onSelect(i),
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: active
                      ? PaperColors.inkAccent
                      : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: Text(
              labels[i],
              style: AppTypography.tag.copyWith(
                color: active
                    ? PaperColors.inkAccent
                    : PaperColors.inkSecondary,
                fontWeight: active ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _ClarityDotsRow extends StatelessWidget {
  const _ClarityDotsRow({
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
          return GestureDetector(
            onTap: () => onSelect(level),
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 28,
              height: 28,
              alignment: Alignment.center,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: active
                      ? PaperColors.inkAccent
                      : Colors.transparent,
                  border: Border.all(
                    color: PaperColors.inkSecondary,
                    width: 1,
                  ),
                ),
              ),
            ),
          );
        }),
        const SizedBox(width: 8),
        Text(
          label,
          style: AppTypography.label.copyWith(color: PaperColors.inkAccent),
        ),
      ],
    );
  }
}

class _LucidityStampToggle extends StatelessWidget {
  const _LucidityStampToggle({
    required this.stamped,
    required this.onToggle,
  });

  final bool stamped;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          const _NotebookLabel('LUCIDITY'),
          const SizedBox(width: 16),
          if (stamped)
            Transform.rotate(
              angle: -0.055, // ~ -3°
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: PaperColors.stampRed, width: 2),
                ),
                child: Text(
                  'ACHIEVED',
                  style: AppTypography.tag.copyWith(
                    color: PaperColors.stampRed,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.5,
                  ),
                ),
              ),
            )
          else
            Text(
              'tap to stamp',
              style: AppTypography.notebookHint(),
            ),
        ],
      ),
    );
  }
}

class _MarginNoteChips extends StatelessWidget {
  const _MarginNoteChips({
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Text(
              addLabel,
              style: AppTypography.notebookHint(
                color: PaperColors.inkAccent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _InkChip extends StatelessWidget {
  const _InkChip({
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
        border: Border.all(color: color, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 3, 4, 3),
            child: Text(
              label,
              style: AppTypography.tag.copyWith(color: color),
            ),
          ),
          GestureDetector(
            onTap: onRemove,
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              width: 26,
              height: 26,
              child: Center(
                child: TerminalGlyph(Glyphs.close, size: 10, color: color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

