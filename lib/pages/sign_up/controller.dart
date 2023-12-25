import 'package:get/get.dart';

import '../../providers/providers.dart';
import '../../services/services.dart';
import '../../utils/utils.dart';
import '../pages.dart';

class SignUpController extends GetxController {
  static SignUpController get to => Get.find();

  final DatabaseService db = Get.find();
  final NotificationService notif = Get.find();
  final AccountsProvider api = Get.find();

  final RxString name = ''.obs;
  final RxString email = ''.obs;
  final RxString password = ''.obs;

  Future<void> signUp() async {
    if (email.value.isEmpty || password.value.isEmpty) {
      notif.showErrorSnackbar('Email and password cannot be empty');
      return;
    }

    final response = await api.signUp(email.value, password.value);
    response.handleResponse(
      onSuccess: (result) async {
        await db.setAccountInVerification(email.value);
        Get.offAllNamed(EmailVerificationPage.routeName);
      },
      errorTitle: 'Cannot sign up',
      errorMessage: 'Email already exists',
    );
  }
}
