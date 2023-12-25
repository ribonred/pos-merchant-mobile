import 'package:get/get.dart';

import '../../providers/providers.dart';
import 'sign_up.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountsProvider>(() => AccountsProvider());
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
