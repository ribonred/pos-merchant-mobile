import 'package:get/get.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../../services/services.dart';
import '../../utils/utils.dart';
import '../pages.dart';

class SignInController extends GetxController {
  static SignInController get to => Get.find();

  final DatabaseService db = Get.find();
  final NotificationService notif = Get.find();
  final AuthProvider api = Get.find();

  final RxString email = ''.obs;
  final RxString password = ''.obs;

  Future<void> logIn() async {
    if (email.value.isEmpty || password.value.isEmpty) {
      notif.showErrorSnackbar('Email and password cannot be empty');
      return;
    }

    final response = await api.logIn(email.value, password.value);
    response.handleResponse(
      onSuccess: (result) async {
        // user is not verified, redirect to email verification page
        if (response.statusCode == 202) {
          await db.setAccountInVerification(email.value);
          Get.toNamed(EmailVerificationPage.routeName);

          return;
        }

        result as Authorization;

        await db.setSession(result.access!, result.refresh!);
        Get.offAllNamed(HomePage.routeName);
      },
      errorTitle: 'Cannot log in',
      errorMessage: 'Invalid email or password',
      handle401: false,
    );
  }
}
