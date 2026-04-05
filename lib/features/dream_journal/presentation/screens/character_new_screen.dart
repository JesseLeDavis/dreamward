import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../bloc/entity_cubit.dart';

class CharacterNewScreen extends StatelessWidget {
  const CharacterNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CharacterNewBody();
  }
}

class _CharacterNewBody extends StatefulWidget {
  const _CharacterNewBody();

  @override
  State<_CharacterNewBody> createState() => _CharacterNewBodyState();
}

class _CharacterNewBodyState extends State<_CharacterNewBody> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _archetypeController = TextEditingController();
  bool _isRealPerson = false;
  bool _saving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _archetypeController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('NAME IS REQUIRED.')),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      await context.read<EntityCubit>().createCharacter(
            name: name,
            description: _descriptionController.text.trim().isEmpty
                ? null
                : _descriptionController.text.trim(),
            isRealPerson: _isRealPerson,
            archetypeTag: _archetypeController.text.trim().isEmpty
                ? null
                : _archetypeController.text.trim(),
          );
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (mounted) {
        setState(() => _saving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ERROR: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenH,
          vertical: AppSpacing.screenV,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _LabeledField(
              label: 'NAME',
              child: _BorderedTextField(
                controller: _nameController,
                hintText: '---',
                maxLines: 1,
                textCapitalization: TextCapitalization.words,
              ),
            ),
            const SizedBox(height: AppSpacing.sectionGap),

            // Real person toggle
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.cardPad, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.backgroundSurface,
                border: Border.all(color: AppColors.borderNormal),
              ),
              child: Row(
                children: [
                  Text('REAL PERSON', style: AppTypography.label),
                  const Spacer(),
                  Switch(
                    value: _isRealPerson,
                    onChanged: (v) => setState(() => _isRealPerson = v),
                    activeThumbColor: AppColors.amber,
                    inactiveThumbColor: AppColors.borderStrong,
                    inactiveTrackColor: AppColors.backgroundDeep,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sectionGap),

            _LabeledField(
              label: 'ARCHETYPE / ROLE',
              child: _BorderedTextField(
                controller: _archetypeController,
                hintText: 'e.g. MENTOR / SHADOW / GUIDE',
                maxLines: 1,
                textCapitalization: TextCapitalization.characters,
              ),
            ),
            const SizedBox(height: AppSpacing.sectionGap),

            _LabeledField(
              label: 'NOTES',
              child: _BorderedTextField(
                controller: _descriptionController,
                hintText: '---',
                maxLines: null,
                minLines: 4,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundDeep,
      leading: IconButton(
        icon: const Icon(Icons.close, size: 18, color: AppColors.textSecondary),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text('LOG CHARACTER', style: AppTypography.heading),
      actions: [
        TextButton(
          onPressed: _saving ? null : _save,
          child: _saving
              ? const SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    color: AppColors.amber,
                  ),
                )
              : Text(
                  'SAVE',
                  style: AppTypography.label.copyWith(color: AppColors.amber),
                ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: AppColors.borderSubtle),
      ),
    );
  }
}

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
    this.textCapitalization = TextCapitalization.none,
  });

  final TextEditingController controller;
  final String? hintText;
  final int? maxLines;
  final int? minLines;
  final TextCapitalization textCapitalization;

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
        textCapitalization: textCapitalization,
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
