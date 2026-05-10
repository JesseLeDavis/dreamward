import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/data_tag.dart';
import '../../../../core/widgets/field_section.dart';
import '../../../../core/widgets/scan_line_overlay.dart';

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

  @override
  void initState() {
    super.initState();
    _loadAffirmations().then((_) => _loadRundown());
    _loadStats();
  }

  Future<void> _loadAffirmations() async {
    // contentType 1 = affirmation
    final items = await _db.contentDao.watchContentByType(1).first;
    if (!mounted || items.isEmpty) return;
    setState(() {
      _affirmations = items.map((c) => c.title).toList();
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
      body: ScanLineOverlay(child: ListView(
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
          _LastSessionSection(
            currentDate: widget.date,
            lastDream: _lastDream,
            lastObe: _lastObe,
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          _StatsStrip(
            sessionsThisMonth: _sessionsThisMonth,
            lastObeDate: _lastObeDate,
          ),
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
      )),
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
          icon: const Icon(Icons.help_outline, size: 18),
          color: AppColors.textSecondary,
          onPressed: () => context.pushNamed(AppRoutes.fieldGuide),
          tooltip: 'Field Guide',
        ),
        IconButton(
          icon: const Icon(Icons.settings_outlined, size: 18),
          color: AppColors.textSecondary,
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
        vertical: 18,
      ),
      child: Text(affirmation, style: AppTypography.displayAmber),
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
          // Editable field area
          GestureDetector(
            onTap: () => setState(() => _editing = true),
            child: _editing
                ? TextField(
                    controller: _controller,
                    autofocus: true,
                    style: AppTypography.body,
                    decoration: InputDecoration(
                      hintText: '// awaiting target coordinates',
                      hintStyle: AppTypography.hint,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.borderSubtle),
                      ),
                      contentPadding: EdgeInsets.zero,
                      filled: false,
                    ),
                    onSubmitted: (_) => _save(),
                    onTapOutside: (_) => _save(),
                  )
                : Text(
                    _hasTarget
                        ? _controller.text
                        : '// awaiting target coordinates',
                    style:
                        _hasTarget ? AppTypography.body : AppTypography.hint,
                  ),
          ),
          const SizedBox(height: 8),
          const Divider(height: 1, color: AppColors.borderSubtle),
          const SizedBox(height: 6),
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

class _LastSessionSection extends StatelessWidget {
  const _LastSessionSection({
    required this.currentDate,
    this.lastDream,
    this.lastObe,
  });

  final String currentDate;
  final Dream? lastDream;
  final ObeLog? lastObe;

  static const _dreamTypeLabels = [
    'NORMAL',
    'LUCID',
    'RECURRING',
    'NIGHTMARE',
    'PROPHETIC',
    'VISITATION',
    'HYPNAGOGIC',
  ];

  static const _dreamTypeColors = [
    AppColors.tagFragmented,
    AppColors.tagLucid,
    AppColors.tagRecurring,
    AppColors.tagNightmare,
    AppColors.tagFragmented,
    AppColors.tagFragmented,
    AppColors.tagFragmented,
  ];

  static const _outcomeLabels = ['ATTEMPTED', 'PARTIAL', 'CLEAN'];

  static const _sessionTypeLabels = ['DELIBERATE', 'AMBIENT', 'BRIDGE'];

  static String _formatDate(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  /// Returns true if the most recent entry is a dream (vs OBE).
  bool get _dreamIsMoreRecent {
    if (lastDream == null) return false;
    if (lastObe == null) return true;
    return lastDream!.createdAt.isAfter(lastObe!.sessionDate);
  }

  bool get _hasData => lastDream != null || lastObe != null;

  @override
  Widget build(BuildContext context) {
    return FieldSection(
      label: 'LAST TRANSMISSION',
      contentPadding: const EdgeInsets.all(AppSpacing.cardPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!_hasData) ...[
            Text('NO TRANSMISSIONS YET.', style: AppTypography.label),
            const SizedBox(height: 4),
            Text(
              'Your most recent session will appear here.',
              style: AppTypography.signalText,
            ),
          ] else if (_dreamIsMoreRecent) ...[
            // Dream display
            Row(
              children: [
                Text('DREAM', style: AppTypography.labelAmber),
                const SizedBox(width: 8),
                Text(
                  _formatDate(lastDream!.createdAt),
                  style: AppTypography.timestamp,
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              lastDream!.title,
              style: AppTypography.body,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            DataTag(
              label: _dreamTypeLabels[lastDream!.dreamType.clamp(0, 6)],
              color: _dreamTypeColors[lastDream!.dreamType.clamp(0, 6)],
            ),
          ] else ...[
            // OBE display
            Row(
              children: [
                Text('OBE SESSION', style: AppTypography.labelAmber),
                const SizedBox(width: 8),
                Text(
                  _formatDate(lastObe!.sessionDate),
                  style: AppTypography.timestamp,
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                DataTag(
                  label: _sessionTypeLabels[lastObe!.sessionType.clamp(0, 2)],
                  color: AppColors.amber,
                ),
                const SizedBox(width: 6),
                DataTag(
                  label: _outcomeLabels[lastObe!.entryState.clamp(0, 2)],
                  color: lastObe!.entryState == 2
                      ? AppColors.green
                      : lastObe!.entryState == 0
                          ? AppColors.statusAlert
                          : AppColors.amber,
                ),
              ],
            ),
          ],
          const SizedBox(height: AppSpacing.sm),
          const Divider(height: 1, color: AppColors.borderSubtle),
          const SizedBox(height: 8),
          // Log buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => context.pushNamed(AppRoutes.obeNew),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.borderSubtle),
                    foregroundColor: AppColors.textSecondary,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: const Text('+ LOG OBE'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => context.pushNamed(AppRoutes.dreamNew),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.borderSubtle),
                    foregroundColor: AppColors.textSecondary,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: const Text('+ LOG DREAM'),
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
                  style: AppTypography.bodyMuted.copyWith(fontSize: 10),
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

class _StatsStrip extends StatelessWidget {
  const _StatsStrip({
    required this.sessionsThisMonth,
    required this.lastObeDate,
  });

  final int sessionsThisMonth;
  final String lastObeDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.cardPad,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundSurface,
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        children: [
          _StatCol(
            label: 'SESSIONS\nTHIS MONTH',
            value: sessionsThisMonth > 0 ? '$sessionsThisMonth' : '--',
          ),
          const SizedBox(
            width: 1,
            height: 32,
            child: ColoredBox(color: AppColors.borderNormal),
          ),
          _StatCol(label: 'LAST OBE', value: lastObeDate),
        ],
      ),
    );
  }
}

class _StatCol extends StatelessWidget {
  const _StatCol({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: AppTypography.label,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTypography.labelAmber,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}


