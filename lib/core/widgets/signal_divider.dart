import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// A dashed signal-style horizontal divider with an optional center diamond.
///
/// Prominent variant:  ─────── ◇ ───────
/// Subtle variant: alternating 4px dash / 3px gap solid line
class SignalDivider extends StatelessWidget {
  const SignalDivider({
    super.key,
    this.prominent = false,
    this.color = AppColors.borderSubtle,
  });

  final bool prominent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (prominent) {
      return Row(
        children: [
          Expanded(child: _DashedLine(color: color)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '◇',
              style: AppTypography.signalText.copyWith(color: color),
            ),
          ),
          Expanded(child: _DashedLine(color: color)),
        ],
      );
    }
    return _DashedLine(color: color);
  }
}

class _DashedLine extends StatelessWidget {
  const _DashedLine({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      child: CustomPaint(painter: _DashPainter(color: color)),
    );
  }
}

class _DashPainter extends CustomPainter {
  _DashPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    const dashWidth = 4.0;
    const gapWidth = 3.0;
    double x = 0;
    while (x < size.width) {
      canvas.drawLine(Offset(x, 0), Offset(x + dashWidth, 0), paint);
      x += dashWidth + gapWidth;
    }
  }

  @override
  bool shouldRepaint(_DashPainter old) => old.color != color;
}
