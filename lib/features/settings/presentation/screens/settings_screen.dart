import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/notifications/notification_service.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/field_section.dart';
import '../../../../core/widgets/terminal_dialog.dart';
import '../../../../core/widgets/terminal_glyph.dart';
import '../../../../core/widgets/terminal_pickers.dart';
import '../../../../core/widgets/terminal_toast.dart';
import '../../../dream_journal/presentation/bloc/dream_journal_bloc.dart';
import '../../../obe_log/presentation/bloc/obe_log_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _notifs = NotificationService.instance;

  // Notification toggles
  bool _dailyReminderEnabled = false;
  TimeOfDay _dailyReminderTime = const TimeOfDay(hour: 8, minute: 0);

  bool _dreamRecallEnabled = false;
  TimeOfDay _dreamRecallTime = const TimeOfDay(hour: 6, minute: 30);

  @override
  void initState() {
    super.initState();
    _loadNotificationPrefs();
  }

  Future<void> _loadNotificationPrefs() async {
    final dailyEnabled = await _notifs.isDailyReminderEnabled();
    final (dailyH, dailyM) = await _notifs.getDailyReminderTime();
    final recallEnabled = await _notifs.isDreamRecallEnabled();
    final (recallH, recallM) = await _notifs.getDreamRecallTime();
    if (!mounted) return;
    setState(() {
      _dailyReminderEnabled = dailyEnabled;
      _dailyReminderTime = TimeOfDay(hour: dailyH, minute: dailyM);
      _dreamRecallEnabled = recallEnabled;
      _dreamRecallTime = TimeOfDay(hour: recallH, minute: recallM);
    });
  }

  Future<void> _toggleDailyReminder(bool enabled) async {
    if (enabled) {
      await _notifs.requestPermission();
    }
    setState(() => _dailyReminderEnabled = enabled);
    await _notifs.setDailyReminder(
      enabled: enabled,
      hour: _dailyReminderTime.hour,
      minute: _dailyReminderTime.minute,
    );
  }

  Future<void> _updateDailyReminderTime(TimeOfDay time) async {
    setState(() => _dailyReminderTime = time);
    await _notifs.setDailyReminder(
      enabled: _dailyReminderEnabled,
      hour: time.hour,
      minute: time.minute,
    );
  }

  Future<void> _toggleDreamRecall(bool enabled) async {
    if (enabled) {
      await _notifs.requestPermission();
    }
    setState(() => _dreamRecallEnabled = enabled);
    await _notifs.setDreamRecall(
      enabled: enabled,
      hour: _dreamRecallTime.hour,
      minute: _dreamRecallTime.minute,
    );
  }

  Future<void> _updateDreamRecallTime(TimeOfDay time) async {
    setState(() => _dreamRecallTime = time);
    await _notifs.setDreamRecall(
      enabled: _dreamRecallEnabled,
      hour: time.hour,
      minute: time.minute,
    );
  }

  String _formatTime(TimeOfDay t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  Future<void> _pickTime(
    TimeOfDay initial,
    ValueChanged<TimeOfDay> onPicked,
  ) async {
    final picked = await showTerminalTimePicker(
      context: context,
      initialTime: initial,
    );
    if (picked != null) onPicked(picked);
  }

  void _showExportSnackbar() {
    TerminalToast.show(context, 'EXPORT COMING SOON');
  }

  Future<void> _showClearConfirmDialog() async {
    final confirmed = await TerminalDialog.confirm(
      context: context,
      title: 'CLEAR ALL DATA?',
      message:
          'This will permanently delete all dreams, OBE logs, and rundowns. This cannot be undone.',
      confirmLabel: 'CONFIRM',
      destructive: true,
    );
    if (!confirmed || !mounted) return;
    final db = GetIt.instance<AppDatabase>();
    await db.customStatement('DELETE FROM dream_tag_links');
    await db.customStatement('DELETE FROM dream_character_links');
    await db.customStatement('DELETE FROM dream_place_links');
    await db.customStatement('DELETE FROM obe_location_visits');
    await db.customStatement('DELETE FROM dreams');
    await db.customStatement('DELETE FROM obe_logs');
    await db.customStatement('DELETE FROM daily_rundowns');
    await db.customStatement('DELETE FROM dream_tags');
    await db.customStatement('DELETE FROM dream_characters');
    await db.customStatement('DELETE FROM dream_places');
    if (!mounted) return;
    context.read<DreamJournalBloc>().add(LoadDreams());
    context.read<ObeLogBloc>().add(LoadObeLogs());
    TerminalToast.show(context, 'ALL DATA CLEARED', tone: ToastTone.signal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDeep,
        automaticallyImplyLeading: true,
        title: Text('SETTINGS', style: AppTypography.heading),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.borderSubtle),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenH,
          vertical: AppSpacing.screenV,
        ),
        children: [
          // ----------------------------------------------------------------
          // SECTION: NOTIFICATIONS
          // ----------------------------------------------------------------
          Text('NOTIFICATIONS', style: AppTypography.label),
          const SizedBox(height: 6),
          FieldSection(
            label: 'ALERTS',
            contentPadding: EdgeInsets.zero,
            child: Column(
              children: [
                // Daily reminder toggle row
                _ToggleRow(
                  label: 'DAILY REMINDER',
                  sublabel: 'Set a daily practice reminder',
                  value: _dailyReminderEnabled,
                  onChanged: _toggleDailyReminder,
                ),
                if (_dailyReminderEnabled) ...[
                  Container(height: 1, color: AppColors.borderSubtle),
                  _TimeRow(
                    timeLabel: _formatTime(_dailyReminderTime),
                    onTap: () => _pickTime(
                      _dailyReminderTime,
                      _updateDailyReminderTime,
                    ),
                  ),
                ],
                Container(height: 1, color: AppColors.borderSubtle),
                // Dream recall toggle row
                _ToggleRow(
                  label: 'DREAM RECALL ALARM',
                  sublabel: 'Wake-up reminder to log dreams',
                  value: _dreamRecallEnabled,
                  onChanged: _toggleDreamRecall,
                ),
                if (_dreamRecallEnabled) ...[
                  Container(height: 1, color: AppColors.borderSubtle),
                  _TimeRow(
                    timeLabel: _formatTime(_dreamRecallTime),
                    onTap: () => _pickTime(
                      _dreamRecallTime,
                      _updateDreamRecallTime,
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.sectionGap),

          // ----------------------------------------------------------------
          // SECTION: DISPLAY
          // ----------------------------------------------------------------
          Text('DISPLAY', style: AppTypography.label),
          const SizedBox(height: 6),
          FieldSection(
            label: 'APPEARANCE',
            contentPadding: EdgeInsets.zero,
            child: _InfoRow(label: 'THEME', value: 'DARK'),
          ),

          const SizedBox(height: AppSpacing.sectionGap),

          // ----------------------------------------------------------------
          // SECTION: DATA
          // ----------------------------------------------------------------
          Text('DATA', style: AppTypography.label),
          const SizedBox(height: 6),
          FieldSection(
            label: 'STORAGE',
            contentPadding: EdgeInsets.zero,
            child: Column(
              children: [
                _ActionRow(
                  label: 'EXPORT DATA',
                  onTap: _showExportSnackbar,
                ),
                Container(height: 1, color: AppColors.borderSubtle),
                _ActionRow(
                  label: 'CLEAR ALL DATA',
                  labelColor: AppColors.statusAlert,
                  onTap: _showClearConfirmDialog,
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.sectionGap),

          // ----------------------------------------------------------------
          // SECTION: HELP
          // ----------------------------------------------------------------
          Text('HELP', style: AppTypography.label),
          const SizedBox(height: 6),
          FieldSection(
            label: 'RESOURCES',
            contentPadding: EdgeInsets.zero,
            child: _ActionRow(
              label: 'VIEW TUTORIAL',
              onTap: () => context.pushNamed(AppRoutes.onboarding),
            ),
          ),

          const SizedBox(height: AppSpacing.sectionGap),

          // ----------------------------------------------------------------
          // SECTION: ABOUT
          // ----------------------------------------------------------------
          Text('ABOUT', style: AppTypography.label),
          const SizedBox(height: 6),
          FieldSection(
            label: 'SYSTEM',
            contentPadding: EdgeInsets.zero,
            child: Column(
              children: [
                _InfoRow(label: 'VERSION', value: '1.0.0'),
                Container(height: 1, color: AppColors.borderSubtle),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.cardPad,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('DREAMWARD', style: AppTypography.body),
                      const SizedBox(height: 4),
                      Text(
                        'Non-extractive. Local-only. No account required.',
                        style: AppTypography.bodyMuted,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Row widgets
// ---------------------------------------------------------------------------

/// A toggle row with label, sublabel, and amber Switch.
class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.label,
    required this.sublabel,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final String sublabel;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.cardPad,
        vertical: 12,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTypography.body),
                const SizedBox(height: 2),
                Text(sublabel, style: AppTypography.bodyMuted),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppColors.amber,
          ),
        ],
      ),
    );
  }
}

/// A sub-row showing a tappable time value (shown when the toggle above is on).
class _TimeRow extends StatelessWidget {
  const _TimeRow({
    required this.timeLabel,
    required this.onTap,
  });

  final String timeLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.cardPad,
          vertical: 10,
        ),
        color: AppColors.amberMuted,
        child: Row(
          children: [
            Text('TIME', style: AppTypography.label),
            const Spacer(),
            Text(timeLabel, style: AppTypography.labelAmber),
            const SizedBox(width: 6),
            const TerminalGlyph(Glyphs.edit, size: 12, color: AppColors.amberDim),
          ],
        ),
      ),
    );
  }
}

/// A static info row — label on left, value on right, no tap action.
class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.cardPad,
        vertical: 12,
      ),
      child: Row(
        children: [
          Text(label, style: AppTypography.body),
          const Spacer(),
          Text(value, style: AppTypography.bodyMuted),
        ],
      ),
    );
  }
}

/// A tappable action row with chevron.
class _ActionRow extends StatelessWidget {
  const _ActionRow({
    required this.label,
    required this.onTap,
    this.labelColor,
  });

  final String label;
  final VoidCallback onTap;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.cardPad,
          vertical: 12,
        ),
        child: Row(
          children: [
            Text(
              label,
              style: AppTypography.body.copyWith(
                color: labelColor,
              ),
            ),
            const Spacer(),
            TerminalGlyph(
              Glyphs.chevronRight,
              size: 14,
              color: labelColor ?? AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
