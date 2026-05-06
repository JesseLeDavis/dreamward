import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Bordered terminal-style date picker. Replaces [showDatePicker].
/// Three vertical scroll columns (YEAR / MONTH / DAY) — sharp corners, amber
/// selection band, no Material chrome.
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

/// Bordered terminal-style time picker. Replaces [showTimePicker].
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

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundSurface,
          border: Border.all(color: AppColors.borderStrong),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _PickerHeader(label: 'SELECT DATE'),
            SizedBox(
              height: 180,
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
                  const _PickerDivider(),
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
                  const _PickerDivider(),
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
            ),
            _PickerActions(onCancel: () => Navigator.of(context).pop(),
                onConfirm: _confirm),
          ],
        ),
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

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 64),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundSurface,
          border: Border.all(color: AppColors.borderStrong),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _PickerHeader(label: 'SELECT TIME'),
            SizedBox(
              height: 180,
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
                  const _PickerDivider(),
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
            ),
            _PickerActions(onCancel: () => Navigator.of(context).pop(),
                onConfirm: _confirm),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shared building blocks
// ---------------------------------------------------------------------------

class _PickerHeader extends StatelessWidget {
  const _PickerHeader({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.cardPad,
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        color: AppColors.backgroundDeep,
        border: Border(
          bottom: BorderSide(color: AppColors.borderSubtle),
        ),
      ),
      child: Text(label, style: AppTypography.labelAmber),
    );
  }
}

class _PickerDivider extends StatelessWidget {
  const _PickerDivider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, color: AppColors.borderSubtle);
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
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 6),
          color: AppColors.backgroundDeep,
          child: Text(
            widget.label,
            style: AppTypography.label,
            textAlign: TextAlign.center,
          ),
        ),
        Container(height: 1, color: AppColors.borderSubtle),
        Expanded(
          child: Stack(
            children: [
              // Selection band — amber-bordered horizontal strip in the center
              Center(
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(color: AppColors.amberMuted),
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
                onSelectedItemChanged: (i) =>
                    widget.onChanged(widget.values[i]),
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

class _PickerActions extends StatelessWidget {
  const _PickerActions({required this.onCancel, required this.onConfirm});
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.borderSubtle)),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onCancel,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  'CANCEL',
                  style: AppTypography.label
                      .copyWith(color: AppColors.textSecondary),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(width: 1, color: AppColors.borderSubtle),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onConfirm,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  'CONFIRM',
                  style: AppTypography.labelAmber,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
