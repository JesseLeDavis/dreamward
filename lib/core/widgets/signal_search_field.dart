import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Shared bordered search field used in list screens (Dreams, OBE).
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
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenH,
        vertical: 8,
      ),
      decoration: const BoxDecoration(
        color: AppColors.backgroundDeep,
        border: Border(bottom: BorderSide(color: AppColors.borderSubtle)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundSurface,
          border: Border.all(color: AppColors.borderNormal),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            const Icon(Icons.search, size: 14, color: AppColors.textSecondary),
            const SizedBox(width: 6),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                style: AppTypography.body,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: AppTypography.hint,
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
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
                    child: Icon(Icons.close,
                        size: 14, color: AppColors.textSecondary),
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
