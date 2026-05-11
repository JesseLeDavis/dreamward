import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// A confirmation/alert dialog framed like field-terminal equipment.
///
/// ┌─ TITLE ─────────────────────────┐
/// │  message body                    │
/// ├──────────────────────────────────┤
/// │ [ CANCEL ]           [ CONFIRM ] │
/// └──────────────────────────────────┘
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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundRaised,
          border: Border.all(color: AppColors.borderStrong),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Header(title: title),
            const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.borderNormal,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.lg,
                AppSpacing.lg,
                AppSpacing.lg,
              ),
              child: body ??
                  Text(
                    message!,
                    style: AppTypography.signalText,
                  ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.borderNormal,
            ),
            _ActionRow(actions: actions),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacing.sectionHeaderH,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.cardPad),
      decoration: const BoxDecoration(
        color: AppColors.amberCarrier,
        border: Border(
          left: BorderSide(color: AppColors.amberDim, width: 4),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        title.toUpperCase(),
        style: AppTypography.labelAmber,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({required this.actions});
  final List<TerminalDialogAction> actions;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (var i = 0; i < actions.length; i++) {
      children.add(
        Expanded(
          child: _ActionButton(action: actions[i]),
        ),
      );
      if (i < actions.length - 1) {
        children.add(
          const VerticalDivider(
            width: 1,
            thickness: 1,
            color: AppColors.borderNormal,
          ),
        );
      }
    }
    return SizedBox(
      height: 44,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.action});
  final TerminalDialogAction action;

  Color _toneColor() {
    switch (action.tone) {
      case TerminalActionTone.alert:
        return AppColors.statusAlert;
      case TerminalActionTone.muted:
        return AppColors.textSecondary;
      case TerminalActionTone.amber:
        return AppColors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _toneColor();
    return InkWell(
      onTap: () => Navigator.of(context).pop(action.value),
      child: Center(
        child: Text(
          '[ ${action.label.toUpperCase()} ]',
          style: AppTypography.label.copyWith(color: color),
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
