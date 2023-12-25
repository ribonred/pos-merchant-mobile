import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../providers/providers.dart';
import '../../services/services.dart';
import '../pages.dart';
import '../../utils/utils.dart';

class EmailVerificationController extends GetxController {
  static EmailVerificationController get to => Get.find();

  final TextEditingController codeController = TextEditingController();
  final DatabaseService db = Get.find();
  final NotificationService notif = Get.find();
  final AccountsProvider api = Get.find();

  String? get accountInVerification => db.accountInVerification;
  bool get isComplete => codeController.text.length == 6;

  @override
  void onClose() {
    codeController.dispose();
    super.onClose();
  }

  void appendCode(String value) {
    if (codeController.text.length < 6) {
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

  Future<void> resendCode() async {
    notif.showInfoSnackbar('Resending code');
    codeController.clear();

    final response = await api.requestVerificationCode(accountInVerification!);
    response.handleResponse(
      onSuccess: (result) => notif.showInfoSnackbar('Code sent'),
      errorTitle: 'Cannot resend code',
    );
  }

  Future<void> submitCode() async {
    if (!isComplete) {
      notif.showErrorSnackbar('Please fill in the code');
      return;
    }

    final response = await api.verifyAccount(
      accountInVerification!,
      codeController.text,
    );
    response.handleResponse(
      onSuccess: (result) async {
        await db.clearSession();
        Get.offAllNamed(SignInPage.routeName);
      },
      errorTitle: 'Cannot verify account',
      errorMessage: 'Invalid code',
    );
  }
}
