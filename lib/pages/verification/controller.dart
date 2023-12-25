import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  final TextEditingController codeController = TextEditingController();

  bool get isComplete => codeController.text.length == 4;

  @override
  void onClose() {
    codeController.dispose();
    super.onClose();
  }

  void appendCode(String value) {
    if (codeController.text.length < 4) {
      codeController.text += value;
      update();
    }
  }

  void deleteCode() {
    if (codeController.text.isNotEmpty) {
      codeController.text = codeController.text.substring(
        0,
        codeController.text.length - 1,
      );
      update();
    }
  }

  void submitCode() {}
}
