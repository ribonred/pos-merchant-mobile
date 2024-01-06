import 'package:get/get.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../../services/services.dart';
import '../pages.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final DatabaseService db = Get.find();
  final MerchantProvider api = Get.find();

  final RxInt currentIndex = 0.obs;
  final RxList<OrderResult> orders = <OrderResult>[].obs;
  final RxDouble totalSales = 0.0.obs;

  List<OrderResult> get paidOrders => orders
      .where((element) => element.orderTotal != '0.00')
      .toList(growable: false);

  List<OrderResult> get unpaidOrders => orders
      .where((element) => element.orderTotal == '0.00')
      .toList(growable: false);

  Future<void> logout() async {
    await db.clearSession();
    Get.offAllNamed(
      SignInPage.routeName,
      predicate: (route) => route.settings.name == WelcomePage.routeName,
    );
  }
}
