import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// A bespoke empty-state placeholder — terminal carrier idle.
///
///   // NO SIGNAL — CARRIER IDLE
///   ━━━━━━━━━━━━━━━━━━━━━━━━━━
///   [ ACTION LABEL ]
///
/// A flat string is the wrong empty state in an instrument UI. This widget
/// renders the absence of data as a dim carrier waveform and a framed call
/// to action — a piece of equipment with nothing to display, not a list.
class EmptyReadout extends StatefulWidget {
  const EmptyReadout({
    super.key,
    required this.label,
    this.sublabel,
    this.actionLabel,
    this.onAction,
    this.height = 140,
  });

  /// Top-line carrier message, e.g. "NO TRANSMISSIONS LOGGED".
  final String label;

  /// Optional second line, e.g. "Tap below to log your first dream."
  final String? sublabel;

  /// Optional framed action label, e.g. "+ LOG DREAM".
  final String? actionLabel;
  final VoidCallback? onAction;

  final double height;

  @override
  State<EmptyReadout> createState() => _EmptyReadoutState();
}

class _EmptyReadoutState extends State<EmptyReadout>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // No self-decoration: the parent (NeuInset / NeuRaised / FieldSection)
    // provides framing. A self-fill here would cover the inset shadow rim.
    return Container(
      height: widget.height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '// ${widget.label}',
            style: AppTypography.signalText.copyWith(
              color: AppColors.amberDim,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) => CustomPaint(
              size: const Size(double.infinity, 6),
              painter: _CarrierPainter(progress: _controller.value),
            ),
          ),
          if (widget.sublabel != null) ...[
            const SizedBox(height: 10),
            Text(
              widget.sublabel!,
              style: AppTypography.microMono,
              textAlign: TextAlign.center,
            ),
          ],
          if (widget.actionLabel != null && widget.onAction != null) ...[
            const SizedBox(height: 14),
            GestureDetector(
              onTap: widget.onAction,
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.amberDim),
                ),
                child: Text(
                  '[ ${widget.actionLabel!.toUpperCase()} ]',
                  style: AppTypography.label.copyWith(color: AppColors.amber),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Draws a faint horizontal carrier line with a brighter "scan" segment
/// sliding across it. Reads as a no-signal indicator on equipment.
class _CarrierPainter extends CustomPainter {
  _CarrierPainter({required this.progress});
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final base = Paint()
      ..color = AppColors.borderStrong
      ..strokeWidth = 1;

    final highlight = Paint()
      ..color = AppColors.signalGreenDim
      ..strokeWidth = 1;

    final y = size.height / 2;

    // Dashed base line — characters worth of carrier.
    const dash = 4.0;
    const gap = 3.0;
    var x = 0.0;
    while (x < size.width) {
      canvas.drawLine(Offset(x, y), Offset(x + dash, y), base);
      x += dash + gap;
    }

    // Scan segment — a short brighter run that slides across.
    final segmentWidth = size.width * 0.18;
    final scanStart =
        (progress * (size.width + segmentWidth)) - segmentWidth;
    final scanEnd = scanStart + segmentWidth;
    final segLeft = scanStart.clamp(0.0, size.width);
    final segRight = scanEnd.clamp(0.0, size.width);
    if (segRight > segLeft) {
      canvas.drawLine(
          Offset(segLeft, y), Offset(segRight, y), highlight);
    }
  }

  @override
  bool shouldRepaint(_CarrierPainter old) => old.progress != progress;
}
