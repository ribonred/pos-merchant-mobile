import 'package:get/get.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../../services/services.dart';
import '../../utils/utils.dart';
import '../pages.dart';

class SignInController extends GetxController {
  static SignInController get to => Get.find();

  final DatabaseService db = Get.find();
  final AuthProvider api = Get.find();

  final RxString email = ''.obs;
  final RxString password = ''.obs;

  Future<void> logIn() async {
    final response = await api.logIn(email.value, password.value);
    response.handleResponse(
      onSuccess: (result) async {
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
