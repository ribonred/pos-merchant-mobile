import 'package:get/get.dart';

import '../../providers/providers.dart';
import 'verification.dart';

class EmailVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountsProvider());
    Get.lazyPut(() => EmailVerificationController());
  }
}
