import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// A bordered rectangular section with an uppercase label bar at the top.
///
/// Matches the retro "field terminal" visual style:
/// ┌─ LABEL ──────────────────────────────────┐
/// │ child content                             │
/// └──────────────────────────────────────────┘
class FieldSection extends StatelessWidget {
  const FieldSection({
    super.key,
    required this.label,
    required this.child,
    this.trailing,
    this.contentPadding = const EdgeInsets.all(AppSpacing.cardPad),
    this.headerColor = AppColors.amberCarrier,
    this.bodyColor = AppColors.backgroundSurface,
    this.borderColor = AppColors.borderNormal,
  });

  final String label;
  final Widget child;

  /// Optional widget placed at the right end of the header bar.
  final Widget? trailing;

  final EdgeInsetsGeometry contentPadding;
  final Color headerColor;
  final Color bodyColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bodyColor,
        border: Border.all(color: borderColor, width: AppSpacing.borderWidth),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header bar — 4px amber left-border acts as channel indicator
          Container(
            height: AppSpacing.sectionHeaderH,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.cardPad),
            decoration: BoxDecoration(
              color: headerColor,
              border: const Border(
                left: BorderSide(color: AppColors.amberDim, width: 4),
              ),
            ),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    label.toUpperCase(),
                    style: AppTypography.label,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (trailing != null) ...[
                  const SizedBox(width: 8),
                  trailing!,
                ],
              ],
            ),
          ),
          // Divider between header and body
          const Divider(height: 1, thickness: 1, color: AppColors.borderNormal),
          // Body
          Padding(
            padding: contentPadding,
            child: child,
          ),
        ],
      ),
    );
  }
}
