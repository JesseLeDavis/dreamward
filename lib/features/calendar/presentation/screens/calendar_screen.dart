import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/daos/calendar_dao.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/signal_loader.dart';
import '../../../../core/widgets/terminal_glyph.dart';
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
          const _WeekdayHeader(),
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
          const _Legend(),
        ],
      ),
    );
  }

  String _dateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

// ---------------------------------------------------------------------------
// Layout constants — week-number gutter is the only non-trivial geometry.
// ---------------------------------------------------------------------------

const double _gutterWidth = 28;

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
          icon: const TerminalGlyph(Glyphs.chevronLeft, size: 18),
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
          icon: const TerminalGlyph(Glyphs.chevronRight, size: 18),
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
// Weekday header — left gutter slot ("W") + 7 weekday columns.
// ---------------------------------------------------------------------------

class _WeekdayHeader extends StatelessWidget {
  const _WeekdayHeader();

  @override
  Widget build(BuildContext context) {
    const days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundDeep,
        border: Border(
          bottom: BorderSide(color: AppColors.borderSubtle),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: _gutterWidth,
            child: Center(
              child: Text('W',
                  style: AppTypography.microMono
                      .copyWith(color: AppColors.amberDim)),
            ),
          ),
          for (final d in days)
            Expanded(
              child: Center(
                child: Text(d, style: AppTypography.label),
              ),
            ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Month grid — week-number gutter + 7 day cells per row.
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

    return Column(
      children: [
        // Top hairline of the grid.
        Container(height: 1, color: AppColors.borderSubtle),
        for (final week in weeks)
          Expanded(
            child: _WeekRow(
              week: week,
              focusedMonth: focusedMonth,
              summaries: summaries,
              onDayTap: onDayTap,
            ),
          ),
      ],
    );
  }

  List<List<DateTime?>> _buildWeeks(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final startOffset = (firstDay.weekday - 1) % 7;
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;

    final cells = <DateTime?>[
      for (int i = 0; i < startOffset; i++) null,
      for (int d = 1; d <= daysInMonth; d++)
        DateTime(month.year, month.month, d),
    ];

    while (cells.length % 7 != 0) {
      cells.add(null);
    }

    final weeks = <List<DateTime?>>[];
    for (int i = 0; i < cells.length; i += 7) {
      weeks.add(cells.sublist(i, i + 7));
    }
    return weeks;
  }
}

class _WeekRow extends StatelessWidget {
  const _WeekRow({
    required this.week,
    required this.focusedMonth,
    required this.summaries,
    required this.onDayTap,
  });

  final List<DateTime?> week;
  final DateTime focusedMonth;
  final Map<String, CalendarDaySummary> summaries;
  final ValueChanged<DateTime> onDayTap;

  @override
  Widget build(BuildContext context) {
    final referenceDay =
        week.firstWhere((d) => d != null, orElse: () => null);
    final weekNum = referenceDay == null
        ? null
        : _isoWeekNumber(referenceDay);

    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderSubtle),
        ),
      ),
      child: Row(
        children: [
          // Left gutter — week number
          Container(
            width: _gutterWidth,
            decoration: const BoxDecoration(
              color: AppColors.backgroundDeep,
              border: Border(
                right: BorderSide(color: AppColors.borderSubtle),
              ),
            ),
            child: Center(
              child: weekNum == null
                  ? const SizedBox.shrink()
                  : Text(
                      weekNum.toString().padLeft(2, '0'),
                      style: AppTypography.microMono
                          .copyWith(color: AppColors.textMuted),
                    ),
            ),
          ),
          for (var i = 0; i < week.length; i++)
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    right: i < week.length - 1
                        ? const BorderSide(color: AppColors.borderSubtle)
                        : BorderSide.none,
                  ),
                ),
                child: week[i] == null
                    ? const _EmptyCell()
                    : _DayCell(
                        date: week[i]!,
                        isCurrentMonth:
                            week[i]!.month == focusedMonth.month,
                        isToday: _isToday(week[i]!),
                        summary: summaries[_dateStr(week[i]!)],
                        onTap: () => onDayTap(week[i]!),
                      ),
              ),
            ),
        ],
      ),
    );
  }

  bool _isToday(DateTime d) {
    final now = DateTime.now();
    return d.year == now.year && d.month == now.month && d.day == now.day;
  }

  String _dateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

// ---------------------------------------------------------------------------
// Day cell — tabular day number top-left, three-dot indicator strip bottom,
// amber ring on today.
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
    final dayColor = isCurrentMonth
        ? (isToday ? AppColors.amber : AppColors.textPrimary)
        : AppColors.textMuted;

    final hasDream = (summary?.dreamCount ?? 0) > 0;
    final hasObe = (summary?.obeCount ?? 0) > 0;
    final hasRundown = summary?.hasRundown ?? false;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: isCurrentMonth ? onTap : null,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day number — wrapped in an amber pill on today, otherwise plain.
            Container(
              padding: isToday
                  ? const EdgeInsets.symmetric(horizontal: 6, vertical: 2)
                  : EdgeInsets.zero,
              decoration: isToday
                  ? BoxDecoration(
                      color: AppColors.amber,
                      borderRadius: BorderRadius.circular(8),
                    )
                  : null,
              child: Text(
                date.day.toString().padLeft(2, '0'),
                style: AppTypography.body.copyWith(
                  color: isToday ? AppColors.textInverse : dayColor,
                  fontSize: 12,
                  fontWeight: isToday ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
            const Spacer(),
            _IndicatorStrip(
              hasDream: hasDream,
              hasObe: hasObe,
              hasRundown: hasRundown,
              dimmed: !isCurrentMonth,
            ),
          ],
        ),
      ),
    );
  }
}

class _IndicatorStrip extends StatelessWidget {
  const _IndicatorStrip({
    required this.hasDream,
    required this.hasObe,
    required this.hasRundown,
    required this.dimmed,
  });

  final bool hasDream;
  final bool hasObe;
  final bool hasRundown;
  final bool dimmed;

  Color _slot(bool present, Color liveColor) {
    if (!present) return AppColors.borderSubtle;
    if (dimmed) return liveColor.withAlpha(80);
    return liveColor;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _Slot(color: _slot(hasDream, AppColors.signalGreenDim)),
        const SizedBox(width: 3),
        _Slot(color: _slot(hasObe, AppColors.statusSleep)),
        const SizedBox(width: 3),
        _Slot(color: _slot(hasRundown, AppColors.amber)),
      ],
    );
  }
}

class _Slot extends StatelessWidget {
  const _Slot({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 2,
      color: color,
    );
  }
}

class _EmptyCell extends StatelessWidget {
  const _EmptyCell();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundBase.withAlpha(120),
    );
  }
}

// ---------------------------------------------------------------------------
// Legend — sticky bottom strip styled like a paper-map key.
// ---------------------------------------------------------------------------

class _Legend extends StatelessWidget {
  const _Legend();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenH,
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        color: AppColors.backgroundDeep,
        border: Border(
          top: BorderSide(color: AppColors.borderSubtle),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _LegendItem(color: AppColors.signalGreenDim, label: 'DREAM'),
          SizedBox(width: 18),
          _LegendItem(color: AppColors.statusSleep, label: 'OBE'),
          SizedBox(width: 18),
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
        Container(width: 8, height: 2, color: color),
        const SizedBox(width: 6),
        Text(label, style: AppTypography.microMono),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// ISO 8601 week number — week 1 contains the year's first Thursday.
// ---------------------------------------------------------------------------

int _isoWeekNumber(DateTime date) {
  // Move to the Thursday in this ISO week.
  final dayOffset = 4 - date.weekday;
  final thursday = DateTime(date.year, date.month, date.day + dayOffset);
  final firstJan = DateTime(thursday.year, 1, 1);
  final daysSinceFirstJan = thursday.difference(firstJan).inDays;
  return ((daysSinceFirstJan + firstJan.weekday + 6) / 7).floor();
}
