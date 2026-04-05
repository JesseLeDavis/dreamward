import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Animated signal acquisition loader — 6 bars filling left to right.
/// Replaces CircularProgressIndicator throughout the app.
class SignalLoader extends StatefulWidget {
  const SignalLoader({super.key, this.label = 'ACQUIRING SIGNAL...'});

  final String label;

  @override
  State<SignalLoader> createState() => _SignalLoaderState();
}

class _SignalLoaderState extends State<SignalLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(6, (i) {
                // Each bar lights up in sequence: bar i active when
                // animation value is in [i/6, (i+1)/6 + tail]
                final threshold = i / 6.0;
                final active = _controller.value >= threshold;
                return Container(
                  width: 6,
                  height: 14,
                  margin: const EdgeInsets.only(right: 3),
                  color: active ? AppColors.amber : AppColors.borderStrong,
                );
              }),
            );
          },
        ),
        const SizedBox(height: 8),
        Text(widget.label, style: AppTypography.signalText),
      ],
    );
  }
}
