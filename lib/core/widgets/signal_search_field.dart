import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import 'terminal_glyph.dart';

/// Shared search field used in list screens (Dreams, OBE).
/// Renders as a single rounded inset well with no nested decorations.
class SignalSearchField extends StatelessWidget {
  const SignalSearchField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
    required this.hintText,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.screenH,
        8,
        AppSpacing.screenH,
        10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.borderNormal,
          border: Border.all(
            color: AppColors.borderStrong.withValues(alpha: 0.6),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        child: Row(
          children: [
            const TerminalGlyph(
              Glyphs.search,
              size: 14,
              color: AppColors.textSecondary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                style: AppTypography.body,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: AppTypography.hint,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller,
              builder: (_, value, __) {
                if (value.text.isEmpty) return const SizedBox.shrink();
                return GestureDetector(
                  onTap: onClear,
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: TerminalGlyph(
                      Glyphs.close,
                      size: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
