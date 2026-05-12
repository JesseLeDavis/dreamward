import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/neu_surface.dart';
import '../../../../core/widgets/signal_loader.dart';
import '../bloc/entity_cubit.dart';

// Preset tag colors (hex strings stored in DB).
const _kTagColors = [
  '#E8A020', // amber
  '#D45020', // alert red
  '#9060C8', // purple
  '#7AB648', // green
  '#6070A8', // slate blue
  '#1A7A0A', // signal green dim
  '#8A8468', // muted warm
  '#545040', // dark muted
];

/// Bottom sheet for selecting/creating dream tags.
/// Returns the selected [DreamTag] list via Navigator.pop().
Future<List<DreamTag>?> showTagPicker(
  BuildContext context, {
  List<DreamTag> initialSelected = const [],
}) {
  return showModalBottomSheet<List<DreamTag>>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => BlocProvider.value(
      value: context.read<EntityCubit>(),
      child: _TagPickerSheet(initialSelected: initialSelected),
    ),
  );
}

class _TagPickerSheet extends StatefulWidget {
  const _TagPickerSheet({required this.initialSelected});
  final List<DreamTag> initialSelected;

  @override
  State<_TagPickerSheet> createState() => _TagPickerSheetState();
}

class _TagPickerSheetState extends State<_TagPickerSheet> {
  final _searchController = TextEditingController();
  final _newNameController = TextEditingController();
  late List<DreamTag> _selected;
  bool _showCreateForm = false;
  String _newTagColor = _kTagColors[0];
  bool _creating = false;

  @override
  void initState() {
    super.initState();
    _selected = List.from(widget.initialSelected);
    _searchController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _searchController.dispose();
    _newNameController.dispose();
    super.dispose();
  }

  bool _isSelected(DreamTag tag) => _selected.any((t) => t.id == tag.id);

  void _toggleTag(DreamTag tag) {
    setState(() {
      if (_isSelected(tag)) {
        _selected.removeWhere((t) => t.id == tag.id);
      } else {
        _selected.add(tag);
      }
    });
  }

  Future<void> _createTag() async {
    final name = _newNameController.text.trim();
    if (name.isEmpty) return;
    setState(() => _creating = true);
    try {
      final tag =
          await context.read<EntityCubit>().findOrCreateTag(name, _newTagColor);
      if (!mounted) return;
      setState(() {
        if (!_isSelected(tag)) _selected.add(tag);
        _showCreateForm = false;
        _newNameController.clear();
        _creating = false;
      });
    } catch (_) {
      if (mounted) setState(() => _creating = false);
    }
  }

  Color _parseColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return AppColors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _NeuSheetShell(
      title: 'SELECT TAGS',
      onDone: () => Navigator.of(context).pop(_selected),
      children: [
        _NeuSearchField(
          controller: _searchController,
          hint: 'SEARCH TAGS...',
        ),
        const SizedBox(height: AppSpacing.cardGap),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 280),
          child: BlocBuilder<EntityCubit, EntityState>(
            builder: (context, entityState) {
              final all = entityState.tags;
              final query = _searchController.text;
              final displayed = query.trim().isEmpty
                  ? all
                  : all
                      .where((t) => t.name
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                      .toList();

              if (displayed.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  child: Text(
                    query.isEmpty
                        ? 'NO TAGS YET — CREATE ONE BELOW'
                        : 'NO MATCH FOR "${query.toUpperCase()}"',
                    style: AppTypography.bodyMuted,
                    textAlign: TextAlign.center,
                  ),
                );
              }

              return ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: displayed.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, i) {
                  final tag = displayed[i];
                  return _PickerRow(
                    selected: _isSelected(tag),
                    onTap: () => _toggleTag(tag),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: _parseColor(tag.color),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            tag.name.toUpperCase(),
                            style: AppTypography.label,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (_isSelected(tag))
                          const Icon(Icons.check,
                              size: 18, color: AppColors.amber),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: AppSpacing.cardGap),
        if (_showCreateForm)
          _CreateTagForm(
            nameController: _newNameController,
            selectedColor: _newTagColor,
            creating: _creating,
            onColorSelected: (c) => setState(() => _newTagColor = c),
            onCancel: () => setState(() {
              _showCreateForm = false;
              _newNameController.clear();
            }),
            onSave: _createTag,
            parseColor: _parseColor,
          )
        else
          NeuButton(
            label: '+ CREATE NEW TAG',
            expand: true,
            onPressed: () => setState(() => _showCreateForm = true),
          ),
      ],
    );
  }
}

class _CreateTagForm extends StatelessWidget {
  const _CreateTagForm({
    required this.nameController,
    required this.selectedColor,
    required this.creating,
    required this.onColorSelected,
    required this.onCancel,
    required this.onSave,
    required this.parseColor,
  });

  final TextEditingController nameController;
  final String selectedColor;
  final bool creating;
  final ValueChanged<String> onColorSelected;
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final Color Function(String) parseColor;

  @override
  Widget build(BuildContext context) {
    return NeuRaised(
      radius: 14,
      intensity: 0.7,
      padding: const EdgeInsets.all(AppSpacing.cardPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('NEW TAG',
              style:
                  AppTypography.label.copyWith(color: AppColors.amber)),
          const SizedBox(height: 10),
          NeuInset(
            radius: 10,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              controller: nameController,
              style: AppTypography.body,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                hintText: 'TAG NAME',
                hintStyle: AppTypography.hint,
                isCollapsed: true,
                filled: false,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text('COLOR', style: AppTypography.label),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _kTagColors.map((hex) {
              final isSelected = hex == selectedColor;
              return GestureDetector(
                onTap: () => onColorSelected(hex),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: parseColor(hex),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? AppColors.amber
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          Row(
            children: [
              Expanded(
                child: NeuButton(
                  label: 'CANCEL',
                  expand: true,
                  onPressed: creating ? null : onCancel,
                ),
              ),
              const SizedBox(width: AppSpacing.sectionGap),
              Expanded(
                child: NeuButton(
                  label: 'SAVE',
                  tone: NeuButtonTone.amber,
                  expand: true,
                  onPressed: creating ? null : onSave,
                ),
              ),
            ],
          ),
          if (creating) ...[
            const SizedBox(height: 10),
            const Center(child: MiniSignalLoader(color: AppColors.amber)),
          ],
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shared shell + row primitives (also used by character_picker_sheet)
// ---------------------------------------------------------------------------

/// Outer shell for neu-styled bottom sheets: rounded top, drag handle,
/// title + DONE button, then the supplied content.
class _NeuSheetShell extends StatelessWidget {
  const _NeuSheetShell({
    required this.title,
    required this.onDone,
    required this.children,
  });

  final String title;
  final VoidCallback onDone;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.viewInsetsOf(context).bottom;
    final safeBottom = MediaQuery.paddingOf(context).bottom;
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.92,
      expand: false,
      builder: (context, scrollCtrl) {
        return Container(
          decoration: const BoxDecoration(
            color: NeuColors.surfaceBase,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: NeuColors.shadowDark,
                blurRadius: 18,
                offset: Offset(0, -4),
              ),
            ],
          ),
          padding: EdgeInsets.only(bottom: bottomPad),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 6),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: NeuColors.inkMuted,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    AppSpacing.screenH, 8, 8, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(title, style: AppTypography.heading),
                    ),
                    GestureDetector(
                      onTap: onDone,
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Text(
                          'DONE',
                          style: AppTypography.label
                              .copyWith(color: AppColors.amber),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  controller: scrollCtrl,
                  padding: EdgeInsets.fromLTRB(
                    AppSpacing.screenH,
                    4,
                    AppSpacing.screenH,
                    16 + safeBottom,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: children,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Recessed search field — NeuInset well with a Material search icon.
class _NeuSearchField extends StatelessWidget {
  const _NeuSearchField({required this.controller, required this.hint});

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return NeuInset(
      radius: 12,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Icon(Icons.search, size: 18, color: AppColors.textMuted),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              style: AppTypography.body,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: AppTypography.hint,
                isCollapsed: true,
                filled: false,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A selectable row: raised pillow at rest, pressed-in well when selected.
class _PickerRow extends StatelessWidget {
  const _PickerRow({
    required this.child,
    required this.selected,
    required this.onTap,
  });

  final Widget child;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final padding =
        const EdgeInsets.symmetric(horizontal: AppSpacing.cardPad, vertical: 14);
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: selected
          ? NeuInset(radius: 12, padding: padding, child: child)
          : NeuRaised(
              radius: 12,
              intensity: 0.55,
              padding: padding,
              child: child,
            ),
    );
  }
}

// Re-export the shell + search field + row for the character sheet.
// (Kept in this file so we only have one source of truth for the shell.)
class NeuSheetShell extends StatelessWidget {
  const NeuSheetShell({
    super.key,
    required this.title,
    required this.onDone,
    required this.children,
  });

  final String title;
  final VoidCallback onDone;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) =>
      _NeuSheetShell(title: title, onDone: onDone, children: children);
}

class NeuSearchField extends StatelessWidget {
  const NeuSearchField({
    super.key,
    required this.controller,
    required this.hint,
  });

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) =>
      _NeuSearchField(controller: controller, hint: hint);
}

class PickerRow extends StatelessWidget {
  const PickerRow({
    super.key,
    required this.child,
    required this.selected,
    required this.onTap,
  });

  final Widget child;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) =>
      _PickerRow(selected: selected, onTap: onTap, child: child);
}
