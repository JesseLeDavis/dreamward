import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../bloc/entity_cubit.dart';

/// Bottom sheet for selecting characters to link to a dream.
/// Returns the selected [DreamCharacter] list via Navigator.pop().
Future<List<DreamCharacter>?> showCharacterPicker(
  BuildContext context, {
  List<DreamCharacter> initialSelected = const [],
}) {
  return showModalBottomSheet<List<DreamCharacter>>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.backgroundDeep,
    shape: const Border(top: BorderSide(color: AppColors.borderNormal)),
    builder: (_) => BlocProvider.value(
      value: context.read<EntityCubit>(),
      child: _CharacterPickerSheet(initialSelected: initialSelected),
    ),
  );
}

class _CharacterPickerSheet extends StatefulWidget {
  const _CharacterPickerSheet({required this.initialSelected});
  final List<DreamCharacter> initialSelected;

  @override
  State<_CharacterPickerSheet> createState() => _CharacterPickerSheetState();
}

class _CharacterPickerSheetState extends State<_CharacterPickerSheet> {
  final _searchController = TextEditingController();
  late List<DreamCharacter> _selected;

  @override
  void initState() {
    super.initState();
    _selected = List.from(widget.initialSelected);
    _searchController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool _isSelected(DreamCharacter c) => _selected.any((s) => s.id == c.id);

  void _toggleCharacter(DreamCharacter c) {
    setState(() {
      if (_isSelected(c)) {
        _selected.removeWhere((s) => s.id == c.id);
      } else {
        _selected.add(c);
      }
    });
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
                Text('SELECT CHARACTERS', style: AppTypography.heading),
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
                decoration: InputDecoration(
                  hintText: 'SEARCH CHARACTERS...',
                  hintStyle: AppTypography.hint,
                  prefixIcon: const Icon(Icons.search,
                      size: 14, color: AppColors.textMuted),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.cardPad, vertical: 8),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),

          // Character list
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 240),
            child: BlocBuilder<EntityCubit, EntityState>(
              builder: (context, entityState) {
                final query = _searchController.text.toLowerCase();
                final displayed = query.isEmpty
                    ? entityState.characters
                    : entityState.characters
                        .where((c) => c.name.toLowerCase().contains(query))
                        .toList();

                if (displayed.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Text(
                      entityState.characters.isEmpty
                          ? 'NO CHARACTERS LOGGED YET.'
                          : 'NO MATCH FOUND.',
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
                    final character = displayed[i];
                    final selected = _isSelected(character);
                    return GestureDetector(
                      onTap: () => _toggleCharacter(character),
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
                            Text(character.name.toUpperCase(),
                                style: AppTypography.label),
                            if (character.archetypeTag != null) ...[
                              const SizedBox(width: 8),
                              Text(
                                character.archetypeTag!.toUpperCase(),
                                style: AppTypography.tag.copyWith(
                                    color: AppColors.textMuted),
                              ),
                            ],
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

          // Create character shortcut
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenH, vertical: 8),
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(<DreamCharacter>[]);
                context.pushNamed(AppRoutes.characterNew);
              },
              child: const Text('+ CREATE NEW CHARACTER'),
            ),
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
