import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/neu_surface.dart';
import '../bloc/entity_cubit.dart';
import 'tag_picker_sheet.dart' show NeuSheetShell, NeuSearchField, PickerRow;

/// Bottom sheet for selecting characters to link to a dream.
/// Returns the selected [DreamCharacter] list via Navigator.pop().
Future<List<DreamCharacter>?> showCharacterPicker(
  BuildContext context, {
  List<DreamCharacter> initialSelected = const [],
}) {
  return showModalBottomSheet<List<DreamCharacter>>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
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
    return NeuSheetShell(
      title: 'SELECT CHARACTERS',
      onDone: () => Navigator.of(context).pop(_selected),
      children: [
        NeuSearchField(
          controller: _searchController,
          hint: 'SEARCH CHARACTERS...',
        ),
        const SizedBox(height: AppSpacing.cardGap),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 280),
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
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  child: Text(
                    entityState.characters.isEmpty
                        ? 'NO CHARACTERS LOGGED YET'
                        : 'NO MATCH FOUND',
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
                  final character = displayed[i];
                  final selected = _isSelected(character);
                  return PickerRow(
                    selected: selected,
                    onTap: () => _toggleCharacter(character),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  character.name.toUpperCase(),
                                  style: AppTypography.label,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (character.archetypeTag != null) ...[
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    character.archetypeTag!.toUpperCase(),
                                    style: AppTypography.tag.copyWith(
                                        color: AppColors.textMuted),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        if (selected)
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
        NeuButton(
          label: '+ CREATE NEW CHARACTER',
          expand: true,
          onPressed: () {
            Navigator.of(context).pop(<DreamCharacter>[]);
            context.pushNamed(AppRoutes.characterNew);
          },
        ),
      ],
    );
  }
}
