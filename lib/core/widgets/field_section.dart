import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import '../theme/neu_surface.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label — uppercase mono, sits above the pillow.
        Padding(
          padding: const EdgeInsets.only(left: 6, bottom: 8),
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
        // Body — raised neumorphic pillow.
        NeuRaised(
          padding: contentPadding,
          radius: 14,
          child: child,
        ),
      ],
    );
  }
}
