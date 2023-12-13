import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationService extends GetxService {
  static NotificationService get to => Get.find();

  final Curve forwardAnimationCurve = Curves.easeInOutExpo;
  final Duration animationDuration = const Duration(milliseconds: 400);
  final EdgeInsets margin = const EdgeInsets.all(16.0);

  Future<NotificationService> init() async {
    return this;
  }

  void showInfoSnackbar(String message, {String title = 'Info'}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Theme.of(Get.context!).colorScheme.tertiary,
      colorText: Colors.white,
      forwardAnimationCurve: forwardAnimationCurve,
      animationDuration: animationDuration,
      margin: margin,
    );
  }

  void showErrorSnackbar(String message, {String title = 'Error'}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Theme.of(Get.context!).colorScheme.error,
      colorText: Colors.white,
      forwardAnimationCurve: forwardAnimationCurve,
      animationDuration: animationDuration,
      margin: margin,
    );
  }
}
