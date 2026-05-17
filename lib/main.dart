import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_reminder/sevices/notification_service.dart';

import 'screens/alert_details_screen.dart';
import 'screens/create_alert_screen.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.initializeNotifications();

  bool isAllowed =
      await AwesomeNotifications()
          .isNotificationAllowed();

  if (!isAllowed) {

    await AwesomeNotifications()
        .requestPermissionToSendNotifications();
  }

  // CHECK IF APP OPENED FROM NOTIFICATION
  ReceivedAction? initialAction =
      await AwesomeNotifications()
          .getInitialNotificationAction(
            removeFromActionEvents: false,
          );

  Widget homePage = const SplashScreen();

  // IMPORTANT FIX
  // CHECK PAYLOAD INSTEAD OF ID
  if (initialAction != null &&
      initialAction.payload?['alert_message'] != null) {

    final String alert =
        initialAction.payload?['alert_message'] ?? '';

    homePage = AlertDetailsScreen(
      alertText: alert,
    );
  }

  AwesomeNotifications().setListeners(
    onActionReceivedMethod:
        onActionReceivedMethod,
  );

  runApp(MyApp(homePage: homePage));
}

@pragma("vm:entry-point")
Future<void> onActionReceivedMethod(
    ReceivedAction receivedAction) async {

  // IMPORTANT FIX
  // CHECK PAYLOAD
  if (receivedAction.payload?['alert_message'] != null) {

    final String alert =
        receivedAction.payload?['alert_message'] ?? '';

    Get.to(
      () => AlertDetailsScreen(
        alertText: alert,
      ),
    );
  }
}

class MyApp extends StatelessWidget {

  final Widget homePage;

  const MyApp({
    super.key,
    required this.homePage,
  });

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Alertly',

      theme: AppTheme.darkTheme,

      home: homePage,
    );
  }
}