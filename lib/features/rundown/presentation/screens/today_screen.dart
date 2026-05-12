import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/neu_surface.dart';
import '../../../../core/widgets/data_tag.dart';
import '../../../../core/widgets/empty_readout.dart';
import '../../../../core/widgets/field_section.dart';
import '../../../../core/widgets/terminal_glyph.dart';
import '../../../dream_journal/presentation/bloc/dream_journal_bloc.dart';
import '../../../obe_log/presentation/bloc/obe_log_bloc.dart';

// Fallback used only if the content library hasn't seeded yet.
const _fallbackAffirmations = [
  'I AM MORE THAN MY PHYSICAL BODY.',
];

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key, required this.date});

  final String date;

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  int _affirmationIndex = 0;
  List<String> _affirmations = _fallbackAffirmations;

  // Stats
  int _sessionsThisMonth = 0;
  String _lastObeDate = '--';
  Dream? _lastDream;
  ObeLog? _lastObe;

  final _db = GetIt.instance<AppDatabase>();
  StreamSubscription<List<ContentItem>>? _affirmationsSub;
  StreamSubscription<DreamJournalState>? _dreamsSub;
  StreamSubscription<ObeLogState>? _obesSub;

  @override
  void initState() {
    super.initState();
    _subscribeToAffirmations();
    _loadRundown();
    _loadStats();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dreamsSub ??=
        context.read<DreamJournalBloc>().stream.listen((_) => _loadStats());
    _obesSub ??=
        context.read<ObeLogBloc>().stream.listen((_) => _loadStats());
  }

  @override
  void dispose() {
    _affirmationsSub?.cancel();
    _dreamsSub?.cancel();
    _obesSub?.cancel();
    super.dispose();
  }

  void _subscribeToAffirmations() {
    // contentType 1 = affirmation. Stream so adds/edits/deletes propagate
    // live without needing a hot restart.
    _affirmationsSub =
        _db.contentDao.watchContentByType(1).listen((items) {
      if (!mounted || items.isEmpty) return;
      setState(() {
        _affirmations = items.map((c) => c.body).toList();
        if (_affirmationIndex >= _affirmations.length) {
          _affirmationIndex = 0;
        }
      });
    });
  }

  Future<void> _loadRundown() async {
    final rundown = await _db.dailyRundownDao.getRundownByDate(widget.date);
    if (rundown == null || !mounted) return;
    setState(() {
      _ritual['clear'] = rundown.ritualClear;
      _ritual['tone'] = rundown.ritualTone;
      _ritual['field'] = rundown.ritualField;
      _ritual['affirmation'] = rundown.ritualAffirmation;
      _intention = rundown.sleepIntention ?? '';
      if (rundown.affirmationOfDay != null) {
        final idx = _affirmations.indexOf(rundown.affirmationOfDay!);
        if (idx >= 0) _affirmationIndex = idx;
      }
    });
  }

  Future<void> _persistRundown() async {
    await _db.dailyRundownDao.upsertRundown(DailyRundownsCompanion(
      id: Value(widget.date),
      ritualClear: Value(_ritual['clear'] ?? false),
      ritualTone: Value(_ritual['tone'] ?? false),
      ritualField: Value(_ritual['field'] ?? false),
      ritualAffirmation: Value(_ritual['affirmation'] ?? false),
      sleepIntention: Value(_intention.trim().isNotEmpty ? _intention.trim() : null),
      affirmationOfDay: Value(
        _affirmations.isEmpty ? null : _affirmations[_affirmationIndex],
      ),
    ));
  }

  Future<void> _loadStats() async {
    // Current month OBE count
    final now = DateTime.now();
    int monthCount = 0;
    final allObes = await _db.obeDao.getObeLogs(limit: 200);
    final monthPrefix =
        '${now.year}-${now.month.toString().padLeft(2, '0')}';
    for (final obe in allObes) {
      if (obe.rundownDate != null && obe.rundownDate!.startsWith(monthPrefix)) {
        monthCount++;
      }
    }

    // Most recent OBE
    final recentObes = await _db.obeDao.getRecentObeLogs(1);
    final latestObe = recentObes.isNotEmpty ? recentObes.first : null;

    // Most recent dream
    final recentDreams = await _db.dreamDao.getRecentDreams(1);
    final latestDream = recentDreams.isNotEmpty ? recentDreams.first : null;

    if (!mounted) return;
    setState(() {
      _sessionsThisMonth = monthCount;
      _lastObeDate = latestObe != null
          ? _formatDate(latestObe.sessionDate)
          : '--';
      _lastDream = latestDream;
      _lastObe = latestObe;
    });
  }

  static String _formatDate(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  // Ritual checklist — 4 manual steps
  final _ritual = <String, bool>{
    'clear': false,
    'tone': false,
    'field': false,
    'affirmation': false,
  };

  String _intention = '';

  bool get _intentionSet => _intention.trim().isNotEmpty;
  int get _manualComplete => _ritual.values.where((v) => v).length;

  void _cycleAffirmation() {
    if (_affirmations.length <= 1) return;
    setState(() => _affirmationIndex = (_affirmationIndex + 1) % _affirmations.length);
    _persistRundown();
  }

  void _toggleRitual(String key) {
    setState(() => _ritual[key] = !(_ritual[key] ?? false));
    _persistRundown();
  }

  void _resetRitual() {
    setState(() => _ritual.updateAll((_, __) => false));
    _persistRundown();
  }

  void _onIntentionChanged(String val) {
    setState(() => _intention = val);
    _persistRundown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      appBar: _TodayAppBar(date: widget.date),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenH,
          vertical: AppSpacing.screenV,
        ),
        children: [
          _IntentionSection(
            onChanged: _onIntentionChanged,
            initialValue: _intention,
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          _RitualSection(
            ritual: _ritual,
            intentionSet: _intentionSet,
            intentionText: _intention,
            manualComplete: _manualComplete,
            onToggle: _toggleRitual,
            onReset: _resetRitual,
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          _DashboardPanel(
            sessionsThisMonth: _sessionsThisMonth,
            lastObeDate: _lastObeDate,
            lastDream: _lastDream,
            lastObe: _lastObe,
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          _QuickLogRow(),
          const SizedBox(height: AppSpacing.sectionGap),
          _AffirmationSection(
            affirmation: _affirmations.isEmpty
                ? '---'
                : _affirmations[_affirmationIndex.clamp(0, _affirmations.length - 1)],
            canCycle: _affirmations.length > 1,
            onCycle: _cycleAffirmation,
          ),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// App bar
// ---------------------------------------------------------------------------

class _TodayAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _TodayAppBar({required this.date});

  final String date;

  @override
  Size get preferredSize => const Size.fromHeight(49);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'DREAMWARD',
        style: AppTypography.heading.copyWith(color: AppColors.amber),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Center(child: Text(date, style: AppTypography.timestamp)),
        ),
        IconButton(
          icon: const TerminalGlyph(Glyphs.help, size: 16),
          onPressed: () => context.pushNamed(AppRoutes.fieldGuide),
          tooltip: 'Field Guide',
        ),
        IconButton(
          icon: const Icon(Icons.settings_outlined,
              size: 20, color: AppColors.textSecondary),
          tooltip: 'Settings',
          onPressed: () => context.pushNamed(AppRoutes.settings),
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
// Daily affirmation
// ---------------------------------------------------------------------------

class _AffirmationSection extends StatelessWidget {
  const _AffirmationSection({
    required this.affirmation,
    required this.canCycle,
    required this.onCycle,
  });

  final String affirmation;
  final bool canCycle;
  final VoidCallback onCycle;

  @override
  Widget build(BuildContext context) {
    return FieldSection(
      label: 'UNIT 001 / DAILY DECLARATION',
      headerColor: AppColors.amberMuted,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (canCycle)
            GestureDetector(
              onTap: onCycle,
              child: Text('NEXT ▶', style: AppTypography.labelAmber),
            ),
          if (canCycle) const SizedBox(width: 12),
          GestureDetector(
            onTap: () => context.pushNamed(AppRoutes.affirmationsManage),
            child: Text('MANAGE', style: AppTypography.label),
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.cardPad,
        vertical: 20,
      ),
      child: Text(
        affirmation,
        style: AppTypography.body.copyWith(
          fontSize: 15,
          color: AppColors.amberGlow,
          height: 1.6,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Tonight's intention
// ---------------------------------------------------------------------------

class _IntentionSection extends StatefulWidget {
  const _IntentionSection({
    required this.onChanged,
    this.initialValue = '',
  });

  final ValueChanged<String> onChanged;
  final String initialValue;

  @override
  State<_IntentionSection> createState() => _IntentionSectionState();
}

class _IntentionSectionState extends State<_IntentionSection> {
  final _controller = TextEditingController();
  bool _editing = false;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialValue;
  }

  @override
  void didUpdateWidget(_IntentionSection old) {
    super.didUpdateWidget(old);
    if (old.initialValue != widget.initialValue && !_editing) {
      _controller.text = widget.initialValue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _hasTarget => _controller.text.trim().isNotEmpty;

  void _save() {
    widget.onChanged(_controller.text);
    setState(() => _editing = false);
  }

  void _clear() {
    _controller.clear();
    widget.onChanged('');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FieldSection(
      label: 'SESSION TARGET',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Editable field area — recessed well so the input reads as a
          // place where data goes IN.
          GestureDetector(
            onTap: () => setState(() => _editing = true),
            child: NeuInset(
              radius: 10,
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 12),
              accentBorder: _editing,
              child: _editing
                  ? TextField(
                      controller: _controller,
                      autofocus: true,
                      textCapitalization: TextCapitalization.sentences,
                      style: AppTypography.body,
                      decoration: InputDecoration(
                        hintText: '// awaiting target coordinates',
                        hintStyle: AppTypography.hint,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        filled: false,
                      ),
                      onSubmitted: (_) => _save(),
                      onTapOutside: (_) => _save(),
                    )
                  : Text(
                      _hasTarget
                          ? _controller.text
                          : '// awaiting target coordinates',
                      style: _hasTarget
                          ? AppTypography.body
                          : AppTypography.hint,
                    ),
            ),
          ),
          const SizedBox(height: 10),
          // Status row
          Row(
            children: [
              Text(
                _hasTarget ? 'TARGET ACQUIRED' : 'NO TARGET — OPEN FIELD',
                style: _hasTarget
                    ? AppTypography.labelAmber
                    : AppTypography.label,
              ),
              const Spacer(),
              if (_hasTarget)
                GestureDetector(
                  onTap: _clear,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 10),
                    child: Text('CLEAR ×', style: AppTypography.label),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Last session results
// Shows the most recent logged session regardless of date gap.
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Dashboard panel — multi-cell readout combining month stats, last OBE,
// last transmission, and tonight's moon. Replaces _LastSessionSection +
// _StatsStrip with a denser instrument-style layout.
// ---------------------------------------------------------------------------

const _dreamTypeLabels = [
  'NORMAL',
  'LUCID',
  'RECURRING',
  'NIGHTMARE',
  'PROPHETIC',
  'VISITATION',
  'HYPNAGOGIC',
];

const _dreamTypeColors = [
  AppColors.tagFragmented,
  AppColors.tagLucid,
  AppColors.tagRecurring,
  AppColors.tagNightmare,
  AppColors.tagFragmented,
  AppColors.tagFragmented,
  AppColors.tagFragmented,
];

const _outcomeLabels = ['ATTEMPTED', 'PARTIAL', 'CLEAN'];
const _sessionTypeLabels = ['DELIBERATE', 'AMBIENT', 'BRIDGE'];

String _formatDateShort(DateTime d) =>
    '${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

class _DashboardPanel extends StatelessWidget {
  const _DashboardPanel({
    required this.sessionsThisMonth,
    required this.lastObeDate,
    this.lastDream,
    this.lastObe,
  });

  final int sessionsThisMonth;
  final String lastObeDate;
  final Dream? lastDream;
  final ObeLog? lastObe;

  bool get _dreamIsMoreRecent {
    if (lastDream == null) return false;
    if (lastObe == null) return true;
    return lastDream!.createdAt.isAfter(lastObe!.sessionDate);
  }

  bool get _hasData => lastDream != null || lastObe != null;

  @override
  Widget build(BuildContext context) {
    return FieldSection(
      label: 'DASHBOARD',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 3-cell metrics row — each cell is an inset well so the values
          // read as transmitted readings inside the dashboard pillow.
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: NeuInset(
                    radius: 10,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: _MetricCell(
                      label: 'SESSIONS / MO',
                      value: sessionsThisMonth > 0
                          ? sessionsThisMonth.toString().padLeft(2, '0')
                          : '--',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: NeuInset(
                    radius: 10,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: _MetricCell(
                      label: 'LAST OBE',
                      value: lastObeDate,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: NeuInset(
                    radius: 10,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: _MoonCell(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Wide last-transmission well
          NeuInset(
            radius: 10,
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.cardPad, vertical: 10),
            child: !_hasData
                ? const EmptyReadout(
                    label: 'NO TRANSMISSIONS — CARRIER IDLE',
                    sublabel: 'Your most recent session will appear here.',
                    height: 96,
                  )
                : _dreamIsMoreRecent
                    ? _LastDreamRow(dream: lastDream!)
                    : _LastObeRow(obe: lastObe!),
          ),
        ],
      ),
    );
  }
}

class _MetricCell extends StatelessWidget {
  const _MetricCell({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.microMono),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTypography.displayAmber.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}

class _MoonCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final phase = _moonPhase(DateTime.now());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('MOON', style: AppTypography.microMono),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _moonGlyph(phase),
              style: const TextStyle(
                color: AppColors.amber,
                fontSize: 18,
                height: 1.0,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              _moonLabel(phase),
              style: AppTypography.labelAmber,
            ),
          ],
        ),
      ],
    );
  }
}

class _LastDreamRow extends StatelessWidget {
  const _LastDreamRow({required this.dream});
  final Dream dream;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('LAST TXMIT', style: AppTypography.microMono),
            const SizedBox(width: 8),
            Text('▸ DREAM',
                style: AppTypography.label
                    .copyWith(color: AppColors.amber)),
            const Spacer(),
            Text(
              _formatDateShort(dream.createdAt),
              style: AppTypography.timestamp,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          dream.title,
          style: AppTypography.body,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6),
        DataTag(
          label: _dreamTypeLabels[dream.dreamType.clamp(0, 6)],
          color: _dreamTypeColors[dream.dreamType.clamp(0, 6)],
        ),
      ],
    );
  }
}

class _LastObeRow extends StatelessWidget {
  const _LastObeRow({required this.obe});
  final ObeLog obe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('LAST TXMIT', style: AppTypography.microMono),
            const SizedBox(width: 8),
            Text('▸ OBE',
                style: AppTypography.label
                    .copyWith(color: AppColors.amber)),
            const Spacer(),
            Text(
              _formatDateShort(obe.sessionDate),
              style: AppTypography.timestamp,
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            DataTag(
              label: _sessionTypeLabels[obe.sessionType.clamp(0, 2)],
              color: AppColors.amber,
            ),
            const SizedBox(width: 6),
            DataTag(
              label: _outcomeLabels[obe.entryState.clamp(0, 2)],
              color: obe.entryState == 2
                  ? AppColors.signalGreenDim
                  : obe.entryState == 0
                      ? AppColors.statusAlert
                      : AppColors.amber,
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickLogRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NeuButton(
            label: '+ LOG OBE',
            tone: NeuButtonTone.amber,
            expand: true,
            padding: const EdgeInsets.symmetric(vertical: 14),
            onPressed: () => context.pushNamed(AppRoutes.obeNew),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: NeuButton(
            label: '+ LOG DREAM',
            tone: NeuButtonTone.amber,
            expand: true,
            padding: const EdgeInsets.symmetric(vertical: 14),
            onPressed: () => context.pushNamed(AppRoutes.dreamNew),
          ),
        ),
      ],
    );
  }
}

// Moon-phase math — duplicated from status_strip.dart so the dashboard
// stays self-contained. If we add a third caller, lift to a util file.
double _moonPhase(DateTime date) {
  final ref = DateTime.utc(2000, 1, 6, 18, 14);
  const synodic = 29.530588853;
  final daysSince = date.toUtc().difference(ref).inMinutes / (60 * 24);
  var phase = (daysSince / synodic) % 1.0;
  if (phase < 0) phase += 1;
  return phase;
}

String _moonGlyph(double phase) {
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

// ---------------------------------------------------------------------------
// Practice ritual checklist
// ---------------------------------------------------------------------------

class _RitualSection extends StatelessWidget {
  const _RitualSection({
    required this.ritual,
    required this.intentionSet,
    required this.intentionText,
    required this.manualComplete,
    required this.onToggle,
    required this.onReset,
  });

  final Map<String, bool> ritual;
  final bool intentionSet;
  final String intentionText;
  final int manualComplete;
  final ValueChanged<String> onToggle;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return FieldSection(
      label: 'PRE-TRANSMISSION PROTOCOL',
      child: Column(
        children: [
          _RitualItem(
            label: 'CLEAR',
            sublabel: 'Externalize anything unresolved before entry',
            checked: ritual['clear'] ?? false,
            isAuto: false,
            onTap: () => onToggle('clear'),
          ),
          const SizedBox(height: 10),
          _RitualItem(
            label: 'TONE',
            sublabel: 'Internal or vocal sound resonance',
            checked: ritual['tone'] ?? false,
            isAuto: false,
            onTap: () => onToggle('tone'),
          ),
          const SizedBox(height: 10),
          _RitualItem(
            label: 'FIELD',
            sublabel: 'Extend awareness to your full energy boundary',
            checked: ritual['field'] ?? false,
            isAuto: false,
            onTap: () => onToggle('field'),
          ),
          const SizedBox(height: 10),
          _RitualItem(
            label: 'AFFIRMATION',
            sublabel: 'State your nature — spoken or internally',
            checked: ritual['affirmation'] ?? false,
            isAuto: false,
            onTap: () => onToggle('affirmation'),
          ),
          const SizedBox(height: 10),
          _RitualItem(
            label: 'INTENTION SET',
            sublabel: intentionSet
                ? intentionText
                : 'Set your session target above',
            checked: intentionSet,
            isAuto: true,
            onTap: null,
          ),
          const SizedBox(height: AppSpacing.md),
          const Divider(height: 1, color: AppColors.borderSubtle),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  manualComplete == 4
                      ? 'SEQUENCE COMPLETE\nFIELD READY'
                      : 'SEQUENCE $manualComplete / 4 — STANDBY',
                  style: manualComplete == 4
                      ? AppTypography.labelAmber
                      : AppTypography.label,
                ),
              ),
              GestureDetector(
                onTap: onReset,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 10),
                  child: Text('CLEAR', style: AppTypography.label),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RitualItem extends StatelessWidget {
  const _RitualItem({
    required this.label,
    required this.sublabel,
    required this.checked,
    required this.isAuto,
    this.onTap,
  });

  final String label;
  final String sublabel;
  final bool checked;
  final bool isAuto;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isAuto ? null : onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Checkbox
          Container(
            width: 18,
            height: 18,
            margin: const EdgeInsets.only(top: 1),
            decoration: BoxDecoration(
              color: checked ? AppColors.amberMuted : Colors.transparent,
              border: Border.all(
                color: checked ? AppColors.amber : AppColors.borderNormal,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                checked
                    ? (isAuto ? '●' : '◆')
                    : (isAuto ? '○' : '--'),
                style: TextStyle(
                  color: checked
                      ? (isAuto ? AppColors.signalGreenDim : AppColors.amber)
                      : AppColors.borderStrong,
                  fontSize: checked ? 10 : 8,
                  height: 1.1,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      label,
                      style: AppTypography.body.copyWith(
                        color: checked
                            ? AppColors.textPrimary
                            : AppColors.textMuted,
                      ),
                    ),
                    if (isAuto)
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text('AUTO', style: AppTypography.label),
                      ),
                  ],
                ),
                Text(
                  sublabel,
                  style: AppTypography.microLabel,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Stats strip
// ---------------------------------------------------------------------------



