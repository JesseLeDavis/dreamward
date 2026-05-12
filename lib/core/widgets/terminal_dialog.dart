import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import '../theme/neu_surface.dart';

/// Confirmation/alert dialog rendered as a neumorphic pillow with inset
/// content well and pillow buttons below — matches the rest of the app.
class TerminalDialog extends StatelessWidget {
  const TerminalDialog({
    super.key,
    required this.title,
    required this.actions,
    this.message,
    this.body,
  }) : assert(message != null || body != null,
            'Provide either message or body');

  final String title;
  final String? message;
  final Widget? body;
  final List<TerminalDialogAction> actions;

  /// Show a confirm dialog. Returns the value of the action the user selected,
  /// or null if dismissed.
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    String? message,
    Widget? body,
    required List<TerminalDialogAction<T>> actions,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: AppColors.voidBlack.withAlpha(200),
      builder: (ctx) => TerminalDialog(
        title: title,
        message: message,
        body: body,
        actions: actions,
      ),
    );
  }

  /// Convenience for binary CONFIRM/CANCEL.
  static Future<bool> confirm({
    required BuildContext context,
    required String title,
    required String message,
    String confirmLabel = 'CONFIRM',
    String cancelLabel = 'CANCEL',
    bool destructive = false,
  }) async {
    final result = await show<bool>(
      context: context,
      title: title,
      message: message,
      actions: [
        TerminalDialogAction<bool>(label: cancelLabel, value: false),
        TerminalDialogAction<bool>(
          label: confirmLabel,
          value: true,
          tone: destructive
              ? TerminalActionTone.alert
              : TerminalActionTone.amber,
        ),
      ],
    );
    return result ?? false;
  }

  NeuButtonTone _toneFor(TerminalActionTone tone) {
    switch (tone) {
      case TerminalActionTone.alert:
        return NeuButtonTone.alert;
      case TerminalActionTone.amber:
        return NeuButtonTone.amber;
      case TerminalActionTone.muted:
        return NeuButtonTone.neutral;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
      shape:
          const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: NeuRaised(
        radius: 18,
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title — small uppercase amber label, no header bar.
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 12),
              child: Text(
                title.toUpperCase(),
                style: AppTypography.labelAmber,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Message body sits in a recessed well so it reads as data
            // surfaced from the system.
            NeuInset(
              radius: 12,
              padding: const EdgeInsets.all(AppSpacing.md),
              child: body ??
                  Text(
                    message!,
                    style: AppTypography.signalText,
                  ),
            ),
            const SizedBox(height: AppSpacing.lg),
            // Pillow action buttons.
            Row(
              children: [
                for (var i = 0; i < actions.length; i++) ...[
                  if (i > 0) const SizedBox(width: 10),
                  Expanded(
                    child: NeuButton(
                      label: actions[i].label,
                      tone: _toneFor(actions[i].tone),
                      expand: true,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      onPressed: () =>
                          Navigator.of(context).pop(actions[i].value),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum TerminalActionTone { amber, alert, muted }

class TerminalDialogAction<T> {
  const TerminalDialogAction({
    required this.label,
    required this.value,
    this.tone = TerminalActionTone.muted,
  });

  final String label;
  final T value;
  final TerminalActionTone tone;
}
