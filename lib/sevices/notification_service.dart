import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {

  // UNIQUE NOTIFICATION IDS
  static int _notificationId = 0;

  static int generateId() {

    _notificationId++;

    return _notificationId;
  }

  // INITIALIZE NOTIFICATIONS
  static Future<void> initializeNotifications() async {

    await AwesomeNotifications().initialize(

      null,

      [
        NotificationChannel(

          channelKey: 'alertly_channel',

          channelName: 'Alertly Notifications',

          channelDescription:
              'Notification channel for Alertly',

          importance: NotificationImportance.Max,

          defaultPrivacy: NotificationPrivacy.Public,
        ),
      ],

      debug: true,
    );
  }

  // SUCCESS NOTIFICATION
  // ONLY SHOWS SUCCESS
  // NO NAVIGATION
  static Future<void> showInstantAlert() async {

    await AwesomeNotifications().createNotification(

      content: NotificationContent(

        id: generateId(),

        channelKey: 'alertly_channel',

        title: 'Alert Scheduled',

        body:
            'Your alert has been created successfully.',

        category:
            NotificationCategory.Status,

        autoDismissible: true,

        locked: false,

        actionType:
            ActionType.DisabledAction,
      ),
    );
  }

  // REMINDER NOTIFICATION
  static Future<void> scheduleAlert({
    required String alertText,
  }) async {

    final int id = generateId();

    // EXACT 30 SECONDS
    final DateTime scheduledTime =
        DateTime.now().add(
      const Duration(seconds: 30),
    );

    await AwesomeNotifications().createNotification(

      content: NotificationContent(

        id: id,

        channelKey: 'alertly_channel',

        title: 'Alertly Notification',

        body:
            'You have a pending alert. Tap to view details.',

        payload: {
          'alert_message': alertText,
        },

        // IMPORTANT
        // UNIQUE GROUP
        groupKey: 'alert_$id',

        notificationLayout:
            NotificationLayout.Default,
      ),

      schedule: NotificationCalendar(

        year: scheduledTime.year,

        month: scheduledTime.month,

        day: scheduledTime.day,

        hour: scheduledTime.hour,

        minute: scheduledTime.minute,

        second: scheduledTime.second,

        // IMPORTANT
        // UNIQUE MILLISECOND
        millisecond:
            DateTime.now().millisecond,

        preciseAlarm: true,

        allowWhileIdle: true,
      ),
    );
  }
}