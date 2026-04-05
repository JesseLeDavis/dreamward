import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
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
    backgroundColor: AppColors.backgroundDeep,
    shape: const Border(top: BorderSide(color: AppColors.borderNormal)),
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
    final bottomPad = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPad),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: 36,
            height: 3,
            color: AppColors.borderStrong,
          ),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenH, vertical: 4),
            child: Row(
              children: [
                Text('SELECT TAGS', style: AppTypography.heading),
                const Spacer(),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(_selected),
                  child: Text(
                    'DONE',
                    style:
                        AppTypography.label.copyWith(color: AppColors.amber),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Search field
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenH, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundSurface,
                border: Border.all(color: AppColors.borderNormal),
              ),
              child: TextField(
                controller: _searchController,
                style: AppTypography.body,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'SEARCH TAGS...',
                  hintStyle: AppTypography.hint,
                  prefixIcon: const Icon(Icons.search,
                      size: 14, color: AppColors.textMuted),
                  prefixIconConstraints:
                      const BoxConstraints(minWidth: 36, minHeight: 36),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.cardPad, vertical: 8),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),

          // Tag list — constrained height
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 240),
            child: BlocBuilder<EntityCubit, EntityState>(
              builder: (context, entityState) {
                // Re-filter when state changes (e.g. after tag created).
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
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Text(
                      query.isEmpty
                          ? 'NO TAGS YET. CREATE ONE BELOW.'
                          : 'NO MATCH — CREATE "${query.toUpperCase()}"?',
                      style: AppTypography.signalText,
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenH),
                  itemCount: displayed.length,
                  itemBuilder: (context, i) {
                    final tag = displayed[i];
                    final selected = _isSelected(tag);
                    final tagColor = _parseColor(tag.color);
                    return GestureDetector(
                      onTap: () => _toggleTag(tag),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.cardPad, vertical: 12),
                        decoration: BoxDecoration(
                          color: selected
                              ? AppColors.amberMuted
                              : AppColors.backgroundSurface,
                          border: Border.all(
                            color: selected
                                ? AppColors.amber
                                : AppColors.borderNormal,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: tagColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(tag.name.toUpperCase(),
                                style: AppTypography.label),
                            const Spacer(),
                            if (selected)
                              const Icon(Icons.check,
                                  size: 12, color: AppColors.amber),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // Create new tag
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenH, vertical: 8),
            child: _showCreateForm
                ? _CreateTagForm(
                    nameController: _newNameController,
                    selectedColor: _newTagColor,
                    creating: _creating,
                    onColorSelected: (c) => setState(() => _newTagColor = c),
                    onCancel: () => setState(() {
                      _showCreateForm = false;
                      _newNameController.clear();
                    }),
                    onSave: _createTag,
                  )
                : OutlinedButton(
                    onPressed: () => setState(() => _showCreateForm = true),
                    child: const Text('+ CREATE NEW TAG'),
                  ),
          ),

          const SizedBox(height: 8),
        ],
      ),
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
  });

  final TextEditingController nameController;
  final String selectedColor;
  final bool creating;
  final ValueChanged<String> onColorSelected;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  Color _parseColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return AppColors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.cardPad),
      decoration: BoxDecoration(
        color: AppColors.backgroundSurface,
        border: Border.all(color: AppColors.amber),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('NEW TAG', style: AppTypography.label.copyWith(color: AppColors.amber)),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundDeep,
              border: Border.all(color: AppColors.borderNormal),
            ),
            child: TextField(
              controller: nameController,
              style: AppTypography.body,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                hintText: 'TAG NAME',
                hintStyle: AppTypography.hint,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.cardPad, vertical: 8),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text('COLOR', style: AppTypography.label),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            children: _kTagColors.map((hex) {
              final isSelected = hex == selectedColor;
              return GestureDetector(
                onTap: () => onColorSelected(hex),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: _parseColor(hex),
                    border: Border.all(
                      color: isSelected ? AppColors.amber : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              TextButton(
                onPressed: onCancel,
                child: Text('CANCEL',
                    style: AppTypography.label
                        .copyWith(color: AppColors.textMuted)),
              ),
              const Spacer(),
              FilledButton(
                onPressed: creating ? null : onSave,
                child: creating
                    ? const SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(
                            strokeWidth: 1.5, color: AppColors.textInverse))
                    : const Text('SAVE'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
