import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import '../theme/neu_surface.dart';

/// Neumorphic date picker. Replaces [showDatePicker].
/// Raised pillow shell with an inset well housing three scroll wheels
/// (YEAR / MONTH / DAY).
Future<DateTime?> showTerminalDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
}) {
  return showDialog<DateTime>(
    context: context,
    barrierColor: AppColors.voidBlack.withValues(alpha: 0.7),
    builder: (ctx) => _TerminalDatePickerDialog(
      initial: initialDate,
      first: firstDate,
      last: lastDate,
    ),
  );
}

/// Neumorphic time picker. Replaces [showTimePicker].
Future<TimeOfDay?> showTerminalTimePicker({
  required BuildContext context,
  required TimeOfDay initialTime,
}) {
  return showDialog<TimeOfDay>(
    context: context,
    barrierColor: AppColors.voidBlack.withValues(alpha: 0.7),
    builder: (ctx) => _TerminalTimePickerDialog(initial: initialTime),
  );
}

// ---------------------------------------------------------------------------
// Date picker dialog
// ---------------------------------------------------------------------------

class _TerminalDatePickerDialog extends StatefulWidget {
  const _TerminalDatePickerDialog({
    required this.initial,
    required this.first,
    required this.last,
  });

  final DateTime initial;
  final DateTime first;
  final DateTime last;

  @override
  State<_TerminalDatePickerDialog> createState() =>
      _TerminalDatePickerDialogState();
}

class _TerminalDatePickerDialogState
    extends State<_TerminalDatePickerDialog> {
  late int _year;
  late int _month;
  late int _day;

  @override
  void initState() {
    super.initState();
    _year = widget.initial.year;
    _month = widget.initial.month;
    _day = widget.initial.day;
  }

  int get _daysInMonth => DateTime(_year, _month + 1, 0).day;

  void _confirm() {
    final clampedDay = _day.clamp(1, _daysInMonth);
    Navigator.of(context).pop(DateTime(_year, _month, clampedDay));
  }

  @override
  Widget build(BuildContext context) {
    final years = List<int>.generate(
      widget.last.year - widget.first.year + 1,
      (i) => widget.first.year + i,
    );
    final months = List<int>.generate(12, (i) => i + 1);
    final days = List<int>.generate(_daysInMonth, (i) => i + 1);

    return _PickerShell(
      title: 'SELECT DATE',
      onCancel: () => Navigator.of(context).pop(),
      onConfirm: _confirm,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: _PickerColumn<int>(
              label: 'YEAR',
              values: years,
              selected: _year,
              format: (v) => v.toString(),
              onChanged: (v) => setState(() => _year = v),
            ),
          ),
          Expanded(
            flex: 2,
            child: _PickerColumn<int>(
              label: 'MONTH',
              values: months,
              selected: _month,
              format: (v) => v.toString().padLeft(2, '0'),
              onChanged: (v) => setState(() => _month = v),
            ),
          ),
          Expanded(
            flex: 2,
            child: _PickerColumn<int>(
              label: 'DAY',
              values: days,
              selected: _day.clamp(1, _daysInMonth),
              format: (v) => v.toString().padLeft(2, '0'),
              onChanged: (v) => setState(() => _day = v),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Time picker dialog
// ---------------------------------------------------------------------------

class _TerminalTimePickerDialog extends StatefulWidget {
  const _TerminalTimePickerDialog({required this.initial});

  final TimeOfDay initial;

  @override
  State<_TerminalTimePickerDialog> createState() =>
      _TerminalTimePickerDialogState();
}

class _TerminalTimePickerDialogState
    extends State<_TerminalTimePickerDialog> {
  late int _hour;
  late int _minute;

  @override
  void initState() {
    super.initState();
    _hour = widget.initial.hour;
    _minute = widget.initial.minute;
  }

  void _confirm() {
    Navigator.of(context).pop(TimeOfDay(hour: _hour, minute: _minute));
  }

  @override
  Widget build(BuildContext context) {
    final hours = List<int>.generate(24, (i) => i);
    final minutes = List<int>.generate(60, (i) => i);

    return _PickerShell(
      title: 'SELECT TIME',
      insetHorizontal: 64,
      onCancel: () => Navigator.of(context).pop(),
      onConfirm: _confirm,
      child: Row(
        children: [
          Expanded(
            child: _PickerColumn<int>(
              label: 'HR',
              values: hours,
              selected: _hour,
              format: (v) => v.toString().padLeft(2, '0'),
              onChanged: (v) => setState(() => _hour = v),
            ),
          ),
          Expanded(
            child: _PickerColumn<int>(
              label: 'MIN',
              values: minutes,
              selected: _minute,
              format: (v) => v.toString().padLeft(2, '0'),
              onChanged: (v) => setState(() => _minute = v),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shared building blocks
// ---------------------------------------------------------------------------

/// Outer pillow + header + inset well + action row. Used by both pickers.
class _PickerShell extends StatelessWidget {
  const _PickerShell({
    required this.title,
    required this.child,
    required this.onCancel,
    required this.onConfirm,
    this.insetHorizontal = 32,
  });

  final String title;
  final Widget child;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final double insetHorizontal;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: insetHorizontal),
      child: NeuRaised(
        radius: 16,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 2, bottom: 12),
                child: Row(
                  children: [
                    Text(title, style: AppTypography.labelAmber),
                  ],
                ),
              ),
              NeuInset(
                radius: 12,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(height: 180, child: child),
              ),
              const SizedBox(height: AppSpacing.sectionGap),
              Row(
                children: [
                  Expanded(
                    child: NeuButton(
                      label: 'CANCEL',
                      expand: true,
                      onPressed: onCancel,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sectionGap),
                  Expanded(
                    child: NeuButton(
                      label: 'CONFIRM',
                      tone: NeuButtonTone.amber,
                      expand: true,
                      onPressed: onConfirm,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PickerColumn<T> extends StatefulWidget {
  const _PickerColumn({
    required this.label,
    required this.values,
    required this.selected,
    required this.format,
    required this.onChanged,
  });

  final String label;
  final List<T> values;
  final T selected;
  final String Function(T) format;
  final ValueChanged<T> onChanged;

  @override
  State<_PickerColumn<T>> createState() => _PickerColumnState<T>();
}

class _PickerColumnState<T> extends State<_PickerColumn<T>> {
  late FixedExtentScrollController _ctrl;

  @override
  void initState() {
    super.initState();
    final idx = widget.values.indexOf(widget.selected);
    _ctrl = FixedExtentScrollController(initialItem: idx < 0 ? 0 : idx);
  }

  @override
  void didUpdateWidget(_PickerColumn<T> old) {
    super.didUpdateWidget(old);
    final idx = widget.values.indexOf(widget.selected);
    if (idx >= 0 && _ctrl.hasClients && _ctrl.selectedItem != idx) {
      _ctrl.jumpToItem(idx);
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            widget.label,
            style: AppTypography.label.copyWith(
              color: AppColors.textMuted,
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              // Selection band — soft amber underline pair centered.
              Center(
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: AppColors.amberMuted.withValues(alpha: 0.55),
                      ),
                    ),
                  ),
                ),
              ),
              ListWheelScrollView.useDelegate(
                controller: _ctrl,
                itemExtent: 30,
                physics: const FixedExtentScrollPhysics(),
                perspective: 0.003,
                diameterRatio: 1.6,
                onSelectedItemChanged: (i) {
                  HapticFeedback.selectionClick();
                  widget.onChanged(widget.values[i]);
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: widget.values.length,
                  builder: (context, i) {
                    final v = widget.values[i];
                    final selected = v == widget.selected;
                    return Center(
                      child: Text(
                        widget.format(v),
                        style: (selected
                                ? AppTypography.labelAmber
                                : AppTypography.label)
                            .copyWith(
                          color: selected
                              ? AppColors.amber
                              : AppColors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
