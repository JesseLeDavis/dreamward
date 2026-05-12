import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_typography.dart';

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
    // Keep the shadow tight so neighbouring pillows don't bleed haloes
    // into each other in dense lists or filter rows.
    final blur = 8.0 * intensity;
    final offset = 3.0 * intensity;
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

/// Inset (pressed-in) neumorphic surface — true inner shadows, like
/// CSS `box-shadow: inset`. Dark rim at top-left, light rim at bottom-right
/// makes the surface read as recessed into the parent pillow.
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
    return CustomPaint(
      painter: _NeuInsetPainter(
        radius: radius,
        accentBorder: accentBorder,
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}

/// Paints a recessed well: filled inset surface, then two clipped inner
/// shadows (dark from top-left, light from bottom-right). Optional accent
/// stroke painted last so it sits above the shadows.
class _NeuInsetPainter extends CustomPainter {
  const _NeuInsetPainter({
    required this.radius,
    required this.accentBorder,
  });

  final double radius;
  final bool accentBorder;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    // Base fill — slightly darker than the surrounding raised surface.
    canvas.drawRRect(rrect, Paint()..color = NeuColors.surfaceInset);

    // Clip everything that follows to the rounded rect so the blurred
    // shadow paths only show their inside edge.
    canvas.save();
    canvas.clipRRect(rrect);

    _paintInnerShadow(
      canvas, size,
      offset: const Offset(3, 3),
      blur: 7,
      color: NeuColors.shadowDark,
    );
    _paintInnerShadow(
      canvas, size,
      offset: const Offset(-2, -2),
      blur: 5,
      color: NeuColors.shadowLight.withValues(alpha: 0.85),
    );

    canvas.restore();

    // Accent border (focused input states) — painted on top of the shadows
    // so the rim stays crisp.
    if (accentBorder) {
      final stroke = Paint()
        ..color = NeuColors.accent.withValues(alpha: 0.55)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1;
      // Inset by 0.5 so the 1px stroke sits inside the rrect cleanly.
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          rect.deflate(0.5),
          Radius.circular(radius - 0.5),
        ),
        stroke,
      );
    }
  }

  /// Standard CSS `inset` shadow trick: draw a path that is a large outer
  /// rect with a hole the shape of our rounded rect, shift the hole by the
  /// shadow offset, blur the whole path, and rely on the canvas clip to
  /// keep only the portion inside our well.
  void _paintInnerShadow(
    Canvas canvas,
    Size size, {
    required Offset offset,
    required double blur,
    required Color color,
  }) {
    final pad = blur * 3;
    final outer = Rect.fromLTWH(
      -pad,
      -pad,
      size.width + pad * 2,
      size.height + pad * 2,
    );
    final hole = (Offset.zero & size).shift(offset);
    final path = Path()
      ..addRect(outer)
      ..addRRect(RRect.fromRectAndRadius(hole, Radius.circular(radius)))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur),
    );
  }

  @override
  bool shouldRepaint(_NeuInsetPainter old) =>
      old.radius != radius || old.accentBorder != accentBorder;
}

/// Tone of a NeuButton — controls the foreground color and which palette
/// the label/icon read against the surface.
enum NeuButtonTone { amber, neutral, alert }

/// Pillow-style button. Raised at rest, pressed-in (inset shadow) while
/// the touch is down. Use anywhere we'd otherwise reach for OutlinedButton
/// or a bracketed `[ ACTION ]` label — keeps the surface language consistent.
class NeuButton extends StatefulWidget {
  const NeuButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.tone = NeuButtonTone.neutral,
    this.radius = 12,
    this.padding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.expand = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final NeuButtonTone tone;
  final double radius;
  final EdgeInsetsGeometry padding;

  /// Stretch to fill the parent's main-axis extent. Useful inside Row/Expanded.
  final bool expand;

  @override
  State<NeuButton> createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  bool _down = false;

  Color _fg() {
    switch (widget.tone) {
      case NeuButtonTone.amber:
        return NeuColors.accent;
      case NeuButtonTone.alert:
        return NeuColors.stampRed;
      case NeuButtonTone.neutral:
        return NeuColors.inkPrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final fg = _fg();
    final disabled = widget.onPressed == null;
    final content = Padding(
      padding: widget.padding,
      child: Row(
        mainAxisSize: widget.expand ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.icon != null) ...[
            Icon(widget.icon, size: 16, color: fg),
            const SizedBox(width: 8),
          ],
          Text(
            widget.label.toUpperCase(),
            style: AppTypography.label.copyWith(
              color: disabled ? NeuColors.inkMuted : fg,
            ),
          ),
        ],
      ),
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: disabled
          ? null
          : (_) {
              HapticFeedback.lightImpact();
              setState(() => _down = true);
            },
      onTapCancel: disabled ? null : () => setState(() => _down = false),
      onTapUp: disabled ? null : (_) => setState(() => _down = false),
      onTap: widget.onPressed,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 80),
        transitionBuilder: (c, a) => FadeTransition(opacity: a, child: c),
        child: _down
            ? NeuInset(
                key: const ValueKey('down'),
                radius: widget.radius,
                child: content,
              )
            : NeuRaised(
                key: const ValueKey('up'),
                radius: widget.radius,
                intensity: 0.65,
                child: content,
              ),
      ),
    );
  }
}

/// Raised pillow that depresses (inset) while the touch is held — the
/// generic "tappable card" surface. Same press feel as [NeuButton], but
/// accepts any [child] instead of label+icon. Triggers a light haptic on
/// press down.
class NeuPressable extends StatefulWidget {
  const NeuPressable({
    super.key,
    required this.child,
    required this.onPressed,
    this.radius = 14,
    this.padding,
    this.intensity = 1.0,
    this.onLongPress,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final double intensity;

  @override
  State<NeuPressable> createState() => _NeuPressableState();
}

class _NeuPressableState extends State<NeuPressable> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final disabled = widget.onPressed == null;
    final content = widget.padding == null
        ? widget.child
        : Padding(padding: widget.padding!, child: widget.child);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: disabled
          ? null
          : (_) {
              HapticFeedback.lightImpact();
              setState(() => _down = true);
            },
      onTapCancel: disabled ? null : () => setState(() => _down = false),
      onTapUp: disabled ? null : (_) => setState(() => _down = false),
      onTap: widget.onPressed,
      onLongPress: widget.onLongPress,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 80),
        transitionBuilder: (c, a) => FadeTransition(opacity: a, child: c),
        child: _down
            ? NeuInset(
                key: const ValueKey('down'),
                radius: widget.radius,
                child: content,
              )
            : NeuRaised(
                key: const ValueKey('up'),
                radius: widget.radius,
                intensity: widget.intensity,
                child: content,
              ),
      ),
    );
  }
}
