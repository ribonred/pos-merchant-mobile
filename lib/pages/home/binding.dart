import 'package:get/get.dart';

import '../../providers/providers.dart';
import 'home.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantProvider>(() => MerchantProvider());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
