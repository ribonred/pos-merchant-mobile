import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  final TextEditingController codeController = TextEditingController();

  @override
  void onClose() {
    codeController.dispose();
    super.onClose();
  }

  void appendCode(String value) {
    if (codeController.text.length < 4) {
      codeController.text += value;
    }
  }

  void deleteCode() {
    if (codeController.text.isNotEmpty) {
      codeController.text = codeController.text.substring(
        0,
        codeController.text.length - 1,
      );
    }
  }
}
