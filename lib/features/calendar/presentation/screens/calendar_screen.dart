import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/daos/calendar_dao.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/signal_loader.dart';
import '../bloc/calendar_bloc.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _focusedMonth;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _focusedMonth = DateTime(now.year, now.month);
    context
        .read<CalendarBloc>()
        .add(LoadCalendarMonth(_focusedMonth.year, _focusedMonth.month));
  }

  void _prevMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month - 1);
    });
    context
        .read<CalendarBloc>()
        .add(LoadCalendarMonth(_focusedMonth.year, _focusedMonth.month));
  }

  void _nextMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1);
    });
    context
        .read<CalendarBloc>()
        .add(LoadCalendarMonth(_focusedMonth.year, _focusedMonth.month));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      appBar: _CalendarAppBar(
        month: _focusedMonth,
        onPrev: _prevMonth,
        onNext: _nextMonth,
      ),
      body: Column(
        children: [
          _WeekdayHeader(),
          Expanded(
            child: BlocBuilder<CalendarBloc, CalendarState>(
              builder: (context, state) {
                if (state is CalendarLoading) {
                  return const Center(child: SignalLoader());
                }

                final summaries = state is CalendarLoaded
                    ? state.summaries
                    : <String, CalendarDaySummary>{};

                return _MonthGrid(
                  focusedMonth: _focusedMonth,
                  summaries: summaries,
                  onDayTap: (date) => context.pushNamed(
                    AppRoutes.calendarDay,
                    pathParameters: {'date': _dateStr(date)},
                  ),
                );
              },
            ),
          ),
          _Legend(),
          const SizedBox(height: AppSpacing.screenV),
        ],
      ),
    );
  }

  String _dateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

// ---------------------------------------------------------------------------
// App bar with month navigation
// ---------------------------------------------------------------------------

class _CalendarAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CalendarAppBar({
    required this.month,
    required this.onPrev,
    required this.onNext,
  });

  final DateTime month;
  final VoidCallback onPrev;
  final VoidCallback onNext;

  @override
  Size get preferredSize => const Size.fromHeight(48 + 1);

  static const _months = [
    'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
    'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC',
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('CALENDAR', style: AppTypography.heading),
      actions: [
        IconButton(
          icon: const Icon(Icons.chevron_left, size: 18),
          color: AppColors.textSecondary,
          onPressed: onPrev,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Center(
            child: Text(
              '${_months[month.month - 1]} ${month.year}',
              style: AppTypography.labelAmber,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right, size: 18),
          color: AppColors.textSecondary,
          onPressed: onNext,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: AppColors.borderSubtle),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Weekday header
// ---------------------------------------------------------------------------

class _WeekdayHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    return Container(
      color: AppColors.backgroundDeep,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenH,
        vertical: 8,
      ),
      child: Row(
        children: days
            .map(
              (d) => Expanded(
                child: Center(
                  child: Text(d, style: AppTypography.label),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Month grid
// ---------------------------------------------------------------------------

class _MonthGrid extends StatelessWidget {
  const _MonthGrid({
    required this.focusedMonth,
    required this.summaries,
    required this.onDayTap,
  });

  final DateTime focusedMonth;
  final Map<String, CalendarDaySummary> summaries;
  final ValueChanged<DateTime> onDayTap;

  @override
  Widget build(BuildContext context) {
    final weeks = _buildWeeks(focusedMonth);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
      child: Column(
        children: weeks.map((week) {
          return Expanded(
            child: Row(
              children: week.map((day) {
                return Expanded(
                  child: day == null
                      ? _EmptyCell()
                      : _DayCell(
                          date: day,
                          isCurrentMonth: day.month == focusedMonth.month,
                          isToday: _isToday(day),
                          summary: summaries[_dateStr(day)],
                          onTap: () => onDayTap(day),
                        ),
                );
              }).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }

  List<List<DateTime?>> _buildWeeks(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    // Monday-first: weekday 1=Mon..7=Sun
    final startOffset = (firstDay.weekday - 1) % 7;
    final daysInMonth =
        DateTime(month.year, month.month + 1, 0).day;

    final cells = <DateTime?>[
      for (int i = 0; i < startOffset; i++) null,
      for (int d = 1; d <= daysInMonth; d++) DateTime(month.year, month.month, d),
    ];

    // Pad to full weeks
    while (cells.length % 7 != 0) {
      cells.add(null);
    }

    final weeks = <List<DateTime?>>[];
    for (int i = 0; i < cells.length; i += 7) {
      weeks.add(cells.sublist(i, i + 7));
    }
    return weeks;
  }

  bool _isToday(DateTime d) {
    final now = DateTime.now();
    return d.year == now.year && d.month == now.month && d.day == now.day;
  }

  String _dateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

// ---------------------------------------------------------------------------
// Day cell
// ---------------------------------------------------------------------------

class _DayCell extends StatelessWidget {
  const _DayCell({
    required this.date,
    required this.isCurrentMonth,
    required this.isToday,
    required this.onTap,
    this.summary,
  });

  final DateTime date;
  final bool isCurrentMonth;
  final bool isToday;
  final CalendarDaySummary? summary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textColor = isCurrentMonth
        ? (isToday ? AppColors.amber : AppColors.textPrimary)
        : AppColors.textMuted;

    final hasDream = (summary?.dreamCount ?? 0) > 0;
    final hasObe = (summary?.obeCount ?? 0) > 0;
    final hasRundown = summary?.hasRundown ?? false;
    final hasAny = hasDream || hasObe || hasRundown;

    return GestureDetector(
      onTap: isCurrentMonth ? onTap : null,
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: isToday
              ? AppColors.amberMuted
              : AppColors.backgroundSurface,
          border: Border.all(
            color: isToday ? AppColors.amber : AppColors.borderSubtle,
            width: isToday ? 1.5 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${date.day}',
              style: AppTypography.body.copyWith(color: textColor),
            ),
            const SizedBox(height: 3),
            // Activity dots
            if (hasAny)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (hasDream) _Dot(AppColors.tagVivid),
                  if (hasObe) _Dot(AppColors.statusSleep),
                  if (hasRundown) _Dot(AppColors.amber),
                ],
              )
            else
              const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot(this.color);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

class _EmptyCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: AppColors.backgroundBase,
        border: Border.all(color: AppColors.borderSubtle.withAlpha(60)),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Legend
// ---------------------------------------------------------------------------

class _Legend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenH,
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.borderSubtle)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _LegendItem(color: AppColors.tagVivid, label: 'DREAM'),
          SizedBox(width: 16),
          _LegendItem(color: AppColors.statusSleep, label: 'OBE'),
          SizedBox(width: 16),
          _LegendItem(color: AppColors.amber, label: 'RUNDOWN'),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({required this.color, required this.label});
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 4),
        Text(label, style: AppTypography.label),
      ],
    );
  }
}
