import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import 'signal_loader.dart';

/// One-shot device boot animation. Lines drop in monospace, with the signal
/// loader running between phases. After ~1.2s the [onComplete] callback fires.
///
/// Cosmetic only — actual app init (DI, BLoCs, DB) runs in parallel underneath.
class BootSequence extends StatefulWidget {
  const BootSequence({super.key, required this.onComplete});

  final VoidCallback onComplete;

  @override
  State<BootSequence> createState() => _BootSequenceState();
}

class _BootSequenceState extends State<BootSequence> {
  static const _lines = [
    _BootLine('▸ DREAMWARD v1.0.0', delayMs: 0),
    _BootLine('▸ SECURE LOCAL STORAGE', delayMs: 220),
    _BootLine('▸ FIELD GUIDE ROM OK', delayMs: 400),
    _BootLine('▸ ACQUIRING SIGNAL...', delayMs: 580),
    _BootLine('▸ READY', delayMs: 1000, isReady: true),
  ];

  final List<_BootLine> _printed = [];
  final List<Timer> _timers = [];

  @override
  void initState() {
    super.initState();
    for (final line in _lines) {
      _timers.add(Timer(Duration(milliseconds: line.delayMs), () {
        if (!mounted) return;
        setState(() => _printed.add(line));
      }));
    }
    // Hand control to the app a beat after the final line.
    _timers.add(Timer(const Duration(milliseconds: 1300), () {
      if (mounted) widget.onComplete();
    }));
  }

  @override
  void dispose() {
    for (final t in _timers) {
      t.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.voidBlack,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.lg),
              Text(
                'DREAMWARD',
                style: AppTypography.heading
                    .copyWith(color: AppColors.amber, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text('// FIELD UNIT 001',
                  style: AppTypography.microMono
                      .copyWith(color: AppColors.amberDim)),
              const SizedBox(height: AppSpacing.xl),
              for (final line in _printed) ...[
                Text(
                  line.text,
                  style: AppTypography.body.copyWith(
                    color: line.isReady
                        ? AppColors.signalGreen
                        : AppColors.amberDim,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
              ],
              const SizedBox(height: AppSpacing.md),
              if (_printed.length < _lines.length)
                const MiniSignalLoader(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BootLine {
  const _BootLine(this.text, {required this.delayMs, this.isReady = false});
  final String text;
  final int delayMs;
  final bool isReady;
}
