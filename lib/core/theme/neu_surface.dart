import 'package:flutter/material.dart';

/// Dark-neumorphic surface tokens. Slightly warmer/lighter than AppColors
/// scaffold so light/dark shadows have room to read.
abstract final class NeuColors {
  static const Color surfaceBase   = Color(0xFF1B1E16); // raised resting surface
  static const Color surfaceInset  = Color(0xFF13150F); // pressed / depressed
  static const Color shadowDark    = Color(0xFF06070A); // bottom-right depth
  static const Color shadowLight   = Color(0xFF2C3122); // top-left highlight
  static const Color inkPrimary    = Color(0xFFD4C89A);
  static const Color inkSecondary  = Color(0xFF8A8468);
  static const Color inkMuted      = Color(0xFF545040);
  static const Color accent        = Color(0xFFE8A020);
  static const Color accentDim     = Color(0xFFB87818);
  static const Color stampRed      = Color(0xFFD45020);
}

/// Raised neumorphic pillow — protrudes from the surface.
class NeuRaised extends StatelessWidget {
  const NeuRaised({
    super.key,
    required this.child,
    this.radius = 14,
    this.padding,
    this.intensity = 1.0,
  });

  final Widget child;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final double intensity;

  @override
  Widget build(BuildContext context) {
    final blur = 14.0 * intensity;
    final offset = 5.0 * intensity;
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: NeuColors.surfaceBase,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: NeuColors.shadowDark,
            offset: Offset(offset, offset),
            blurRadius: blur,
          ),
          BoxShadow(
            color: NeuColors.shadowLight,
            offset: Offset(-offset, -offset),
            blurRadius: blur,
          ),
        ],
      ),
      child: child,
    );
  }
}

/// Inset (pressed-in) neumorphic surface — flat darker fill with a faint
/// dark hairline for depth. No diagonal gradient.
class NeuInset extends StatelessWidget {
  const NeuInset({
    super.key,
    required this.child,
    this.radius = 14,
    this.padding,
    this.accentBorder = false,
  });

  final Widget child;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final bool accentBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: NeuColors.surfaceInset,
        borderRadius: BorderRadius.circular(radius),
        border: accentBorder
            ? Border.all(
                color: NeuColors.accent.withValues(alpha: 0.45),
                width: 1,
              )
            : Border.all(
                color: NeuColors.shadowDark.withValues(alpha: 0.6),
                width: 1,
              ),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
