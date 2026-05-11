import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/dream_journal/presentation/bloc/dream_journal_bloc.dart';
import '../../features/obe_log/presentation/bloc/obe_log_bloc.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Persistent device readout — sits above the bottom nav, visible on every
/// screen inside the tab shell. Reads as the housing of a piece of field
/// equipment, not as part of the current screen's UI.
///
/// `[●]  N D / M O   23:47   ◐ MOON`
class StatusStrip extends StatefulWidget {
  const StatusStrip({super.key});

  @override
  State<StatusStrip> createState() => _StatusStripState();
}

class _StatusStripState extends State<StatusStrip> {
  late Timer _ticker;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Tick on the next minute boundary, then every minute.
    final msToNextMinute =
        60000 - (_now.second * 1000 + _now.millisecond);
    _ticker = Timer(Duration(milliseconds: msToNextMinute), _startMinuteTicks);
  }

  void _startMinuteTicks() {
    if (!mounted) return;
    setState(() => _now = DateTime.now());
    _ticker = Timer.periodic(const Duration(minutes: 1), (_) {
      if (!mounted) return;
      setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _ticker.cancel();
    super.dispose();
  }

  String _today() =>
      '${_now.year.toString().padLeft(4, '0')}-${_now.month.toString().padLeft(2, '0')}-${_now.day.toString().padLeft(2, '0')}';

  String _time() =>
      '${_now.hour.toString().padLeft(2, '0')}:${_now.minute.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final today = _today();
    return Container(
      height: 22,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.cardPad),
      decoration: const BoxDecoration(
        color: AppColors.backgroundDeep,
        border: Border(
          top: BorderSide(color: AppColors.borderSubtle),
          bottom: BorderSide(color: AppColors.borderSubtle),
        ),
      ),
      child: DefaultTextStyle.merge(
        style: AppTypography.microMono,
        child: Row(
          children: [
            _LedDot(today: today),
            const SizedBox(width: 8),
            _CountReadout(today: today),
            const Spacer(),
            _Divider(),
            Text(_time(),
                style: AppTypography.microMono
                    .copyWith(color: AppColors.amber)),
            _Divider(),
            _MoonReadout(now: _now),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text('▸',
          style: TextStyle(
            color: AppColors.borderStrong,
            fontSize: 9,
          )),
    );
  }
}

class _LedDot extends StatelessWidget {
  const _LedDot({required this.today});
  final String today;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DreamJournalBloc, DreamJournalState>(
      builder: (context, dState) {
        return BlocBuilder<ObeLogBloc, ObeLogState>(
          builder: (context, oState) {
            final dreams = _todaysDreamCount(dState, today);
            final obe = _todaysObeCount(oState, today);
            final live = dreams + obe > 0;
            final color =
                live ? AppColors.signalGreen : AppColors.amberDim;
            return Row(
              children: [
                Text('[',
                    style: TextStyle(
                        color: AppColors.textMuted, fontSize: 9)),
                Text('●',
                    style: TextStyle(color: color, fontSize: 10)),
                Text(']',
                    style: TextStyle(
                        color: AppColors.textMuted, fontSize: 9)),
                const SizedBox(width: 6),
                Text(
                  live ? 'LOGGED' : 'STANDBY',
                  style: AppTypography.microMono.copyWith(
                    color: live
                        ? AppColors.signalGreenDim
                        : AppColors.textMuted,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _CountReadout extends StatelessWidget {
  const _CountReadout({required this.today});
  final String today;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DreamJournalBloc, DreamJournalState>(
      builder: (context, dState) {
        return BlocBuilder<ObeLogBloc, ObeLogState>(
          builder: (context, oState) {
            final d = _todaysDreamCount(dState, today);
            final o = _todaysObeCount(oState, today);
            return Text(
              '${d.toString().padLeft(2, '0')}D / ${o.toString().padLeft(2, '0')}O',
              style: AppTypography.microMono,
            );
          },
        );
      },
    );
  }
}

int _todaysDreamCount(DreamJournalState s, String today) {
  if (s is! DreamJournalLoaded) return 0;
  return s.dreams.where((d) => d.rundownDate == today).length;
}

int _todaysObeCount(ObeLogState s, String today) {
  if (s is! ObeLogLoaded) return 0;
  return s.logs.where((o) => o.rundownDate == today).length;
}

// ---------------------------------------------------------------------------
// Moon phase readout — synodic-period approximation, four-phase glyph.
// ---------------------------------------------------------------------------

class _MoonReadout extends StatelessWidget {
  const _MoonReadout({required this.now});
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final phase = _moonPhase(now);
    final glyph = _moonGlyph(phase);
    final label = _moonLabel(phase);
    return Row(
      children: [
        Text(glyph,
            style: const TextStyle(
                color: AppColors.amber, fontSize: 11, height: 1.0)),
        const SizedBox(width: 5),
        Text(label, style: AppTypography.microMono),
      ],
    );
  }
}

/// Returns lunar phase as a fraction 0..1 (0 = new, 0.5 = full).
double _moonPhase(DateTime date) {
  // Reference new moon: 2000-01-06 18:14 UTC.
  final ref = DateTime.utc(2000, 1, 6, 18, 14);
  const synodic = 29.530588853;
  final daysSince = date.toUtc().difference(ref).inMinutes / (60 * 24);
  var phase = (daysSince / synodic) % 1.0;
  if (phase < 0) phase += 1;
  return phase;
}

String _moonGlyph(double phase) {
  // Four-phase BMP set — matches the rest of the chrome.
  // ● new ◐ first quarter ○ full ◑ last quarter
  const eighth = 1 / 8;
  if (phase < eighth || phase >= 7 * eighth) return '●';
  if (phase < 3 * eighth) return '◐';
  if (phase < 5 * eighth) return '○';
  return '◑';
}

String _moonLabel(double phase) {
  const eighth = 1 / 8;
  if (phase < eighth) return 'NEW';
  if (phase < 3 * eighth) return 'WAX';
  if (phase < 5 * eighth) return 'FULL';
  if (phase < 7 * eighth) return 'WANE';
  return 'NEW';
}

