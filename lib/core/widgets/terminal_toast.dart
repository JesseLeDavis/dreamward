import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Bottom-anchored, bordered notification strip styled like a status read-out.
///
/// ▌ ▸ AFFIRMATION REQUIRED
///
/// The left bar acts as a channel indicator: amber for operator alerts,
/// signal-green for "logged" confirmations, alert orange for failures.
enum ToastTone { amber, signal, alert }

class TerminalToast {
  TerminalToast._();

  static void show(
    BuildContext context,
    String message, {
    ToastTone tone = ToastTone.amber,
    Duration duration = const Duration(seconds: 3),
  }) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) return;
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.fromLTRB(
          AppSpacing.screenH,
          0,
          AppSpacing.screenH,
          AppSpacing.lg,
        ),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        duration: duration,
        content: _ToastBody(message: message, tone: tone),
      ),
    );
  }
}

class _ToastBody extends StatelessWidget {
  const _ToastBody({required this.message, required this.tone});

  final String message;
  final ToastTone tone;

  Color _barColor() {
    switch (tone) {
      case ToastTone.amber:
        return AppColors.amber;
      case ToastTone.signal:
        return AppColors.signalGreenDim;
      case ToastTone.alert:
        return AppColors.statusAlert;
    }
  }

  Color _textColor() {
    switch (tone) {
      case ToastTone.amber:
        return AppColors.amber;
      case ToastTone.signal:
        return AppColors.signalGreenDim;
      case ToastTone.alert:
        return AppColors.statusAlert;
    }
  }

  String _glyph() {
    switch (tone) {
      case ToastTone.amber:
        return '▸';
      case ToastTone.signal:
        return '●';
      case ToastTone.alert:
        return '!';
    }
  }

  @override
  Widget build(BuildContext context) {
    final accent = _barColor();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundDeep,
        border: Border(
          left: BorderSide(color: accent, width: 4),
          top: const BorderSide(color: AppColors.borderStrong),
          right: const BorderSide(color: AppColors.borderStrong),
          bottom: const BorderSide(color: AppColors.borderStrong),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.cardPad,
        vertical: 12,
      ),
      child: Row(
        children: [
          Text(
            _glyph(),
            style: AppTypography.label.copyWith(color: accent),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message.toUpperCase(),
              style: AppTypography.label.copyWith(
                color: _textColor(),
                letterSpacing: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
