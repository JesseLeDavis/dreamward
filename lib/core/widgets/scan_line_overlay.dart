import 'package:flutter/material.dart';

/// Overlays horizontal scan lines (3px interval, 8% opacity) on top of [child].
///
/// Apply to scaffold body backgrounds on Today and OBE screens.
/// Never wrap text or interactive content — pass it as [child].
class ScanLineOverlay extends StatelessWidget {
  const ScanLineOverlay({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(painter: _ScanLinePainter()),
          ),
        ),
      ],
    );
  }
}

class _ScanLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withAlpha(20) // ~8% opacity
      ..strokeWidth = 1;

    for (double y = 0; y < size.height; y += 3) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_ScanLinePainter old) => false;
}
