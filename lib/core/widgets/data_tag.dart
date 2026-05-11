import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Small bordered tag chip. Used for dream types, OBE states, categories.
///
///   [LUCID]  [VIVID]  [RECURRING]
class DataTag extends StatelessWidget {
  const DataTag({
    super.key,
    required this.label,
    this.color = AppColors.textSecondary,
    this.filled = false,
  });

  final String label;
  final Color color;

  /// If true, fills the background with a dim version of [color].
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: filled ? color.withAlpha(30) : Colors.transparent,
        border: Border.all(color: color.withAlpha(170)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label.toUpperCase(),
        style: AppTypography.tag.copyWith(color: color),
      ),
    );
  }
}
