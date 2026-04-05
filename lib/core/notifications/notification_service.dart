import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const _dailyReminderId = 100;
  static const _dreamRecallId = 101;

  // SharedPreferences keys
  static const _keyDailyEnabled = 'notif_daily_enabled';
  static const _keyDailyHour = 'notif_daily_hour';
  static const _keyDailyMinute = 'notif_daily_minute';
  static const _keyRecallEnabled = 'notif_recall_enabled';
  static const _keyRecallHour = 'notif_recall_hour';
  static const _keyRecallMinute = 'notif_recall_minute';

  Future<void> init() async {
    tz.initializeTimeZones();

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    await _plugin.initialize(settings);
  }

  Future<bool> requestPermission() async {
    final ios = _plugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>();
    if (ios != null) {
      final granted = await ios.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }
    final android = _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    if (android != null) {
      final granted = await android.requestNotificationsPermission();
      return granted ?? false;
    }
    return false;
  }

  // --- Saved preferences ---

  Future<bool> isDailyReminderEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyDailyEnabled) ?? false;
  }

  Future<(int, int)> getDailyReminderTime() async {
    final prefs = await SharedPreferences.getInstance();
    return (
      prefs.getInt(_keyDailyHour) ?? 8,
      prefs.getInt(_keyDailyMinute) ?? 0,
    );
  }

  Future<bool> isDreamRecallEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyRecallEnabled) ?? false;
  }

  Future<(int, int)> getDreamRecallTime() async {
    final prefs = await SharedPreferences.getInstance();
    return (
      prefs.getInt(_keyRecallHour) ?? 6,
      prefs.getInt(_keyRecallMinute) ?? 30,
    );
  }

  // --- Scheduling ---

  Future<void> setDailyReminder({
    required bool enabled,
    required int hour,
    required int minute,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyDailyEnabled, enabled);
    await prefs.setInt(_keyDailyHour, hour);
    await prefs.setInt(_keyDailyMinute, minute);

    await _plugin.cancel(_dailyReminderId);
    if (enabled) {
      await _scheduleDailyNotification(
        id: _dailyReminderId,
        hour: hour,
        minute: minute,
        title: 'DREAMWARD',
        body: 'Time for your daily practice session.',
      );
    }
  }

  Future<void> setDreamRecall({
    required bool enabled,
    required int hour,
    required int minute,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyRecallEnabled, enabled);
    await prefs.setInt(_keyRecallHour, hour);
    await prefs.setInt(_keyRecallMinute, minute);

    await _plugin.cancel(_dreamRecallId);
    if (enabled) {
      await _scheduleDailyNotification(
        id: _dreamRecallId,
        hour: hour,
        minute: minute,
        title: 'DREAM RECALL',
        body: 'Log your dreams before they fade.',
      );
    }
  }

  Future<void> _scheduleDailyNotification({
    required int id,
    required int hour,
    required int minute,
    required String title,
    required String body,
  }) async {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    const androidDetails = AndroidNotificationDetails(
      'dreamward_reminders',
      'Reminders',
      channelDescription: 'Daily practice and dream recall reminders',
      importance: Importance.high,
      priority: Priority.defaultPriority,
    );
    const iosDetails = DarwinNotificationDetails();
    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _plugin.zonedSchedule(
      id,
      title,
      body,
      scheduled,
      details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
