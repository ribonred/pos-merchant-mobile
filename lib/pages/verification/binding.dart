import 'package:get/get.dart';

import 'verification.dart';

class EmailVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmailVerificationController());
  }
}
