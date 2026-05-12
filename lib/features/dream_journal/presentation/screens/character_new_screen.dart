import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/neu_surface.dart';
import '../../../../core/widgets/signal_loader.dart';
import '../../../../core/widgets/terminal_toast.dart';
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
      TerminalToast.show(context, 'NAME IS REQUIRED', tone: ToastTone.alert);
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
        TerminalToast.show(context, 'ERROR: $e', tone: ToastTone.alert);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _LabeledField(
              label: 'NAME',
              child: _NeuTextField(
                controller: _nameController,
                hintText: '---',
                textCapitalization: TextCapitalization.words,
              ),
            ),
            const SizedBox(height: AppSpacing.sectionGap),

            NeuRaised(
              radius: 14,
              intensity: 0.7,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.cardPad,
                vertical: 6,
              ),
              child: Row(
                children: [
                  Text('REAL PERSON', style: AppTypography.label),
                  const Spacer(),
                  Switch(
                    value: _isRealPerson,
                    onChanged: (v) => setState(() => _isRealPerson = v),
                    activeThumbColor: AppColors.amber,
                    activeTrackColor: AppColors.amberMuted,
                    inactiveThumbColor: NeuColors.inkMuted,
                    inactiveTrackColor: NeuColors.surfaceInset,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sectionGap),

            _LabeledField(
              label: 'ARCHETYPE / ROLE',
              child: _NeuTextField(
                controller: _archetypeController,
                hintText: 'e.g. MENTOR / SHADOW / GUIDE',
                textCapitalization: TextCapitalization.characters,
              ),
            ),
            const SizedBox(height: AppSpacing.sectionGap),

            _LabeledField(
              label: 'NOTES',
              child: _NeuTextField(
                controller: _descriptionController,
                hintText: '---',
                maxLines: null,
                minLines: 5,
                narrative: true,
                textCapitalization: TextCapitalization.sentences,
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
      backgroundColor: AppColors.backgroundBase,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.close, size: 24, color: AppColors.textSecondary),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text('LOG CHARACTER', style: AppTypography.heading),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: TextButton(
            onPressed: _saving ? null : _save,
            child: _saving
                ? const MiniSignalLoader()
                : Text(
                    'SAVE',
                    style: AppTypography.label.copyWith(color: AppColors.amber),
                  ),
          ),
        ),
      ],
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
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 8),
          child: Text(label, style: AppTypography.label),
        ),
        child,
      ],
    );
  }
}

class _NeuTextField extends StatelessWidget {
  const _NeuTextField({
    required this.controller,
    this.hintText,
    this.maxLines = 1,
    this.minLines,
    this.narrative = false,
    this.textCapitalization = TextCapitalization.none,
  });

  final TextEditingController controller;
  final String? hintText;
  final int? maxLines;
  final int? minLines;
  final bool narrative;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return NeuInset(
      radius: 12,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      child: TextField(
        controller: controller,
        style: narrative ? AppTypography.neuBody() : AppTypography.body,
        maxLines: maxLines,
        minLines: minLines,
        cursorColor: AppColors.amber,
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: narrative ? AppTypography.neuHint() : AppTypography.hint,
          isCollapsed: true,
          filled: false,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
