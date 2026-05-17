import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_reminder/sevices/notification_service.dart';


class AlertController extends GetxController {

  final TextEditingController alertController =
      TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> createAlert() async {

    final String alertText =
        alertController.text.trim();

    if (alertText.isEmpty) {
      return;
    }

    isLoading.value = true;

    await Future.delayed(
      const Duration(milliseconds: 800),
    );

    // INSTANT DEVICE NOTIFICATION
    await NotificationService.showInstantAlert();

    // SCHEDULE ALERT NOTIFICATION
    await NotificationService.scheduleAlert(
      alertText: alertText,
    );

    alertController.clear();

    isLoading.value = false;
  }
}