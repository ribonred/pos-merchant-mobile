import 'package:get/get.dart';

import 'sign_in.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInProvider>(() => SignInProvider());
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
