import 'package:get/get.dart';

import '../../providers/providers.dart';
import 'sign_in.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
