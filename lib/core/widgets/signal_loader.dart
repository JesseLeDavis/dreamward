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

/// Inline 3-bar variant for in-button save states.
/// Use in place of CircularProgressIndicator inside TextButton/IconButton slots.
class MiniSignalLoader extends StatefulWidget {
  const MiniSignalLoader({super.key, this.color});

  final Color? color;

  @override
  State<MiniSignalLoader> createState() => _MiniSignalLoaderState();
}

class _MiniSignalLoaderState extends State<MiniSignalLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.color ?? AppColors.amber;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final threshold = i / 3.0;
            final active = _controller.value >= threshold;
            return Container(
              width: 4,
              height: 12,
              margin: EdgeInsets.only(right: i == 2 ? 0 : 3),
              color: active ? c : AppColors.borderStrong,
            );
          }),
        );
      },
    );
  }
}
