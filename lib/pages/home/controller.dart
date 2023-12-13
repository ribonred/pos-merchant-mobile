import 'package:get/get.dart';

import '../../services/services.dart';
import '../../utils/utils.dart';
import '../pages.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final DatabaseService db = Get.find();
  final MerchantProvider api = Get.find();

  final RxList<QrMenu?> qrMenu = <QrMenu?>[].obs;
  final RxDouble totalSales = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getQrMenu();
  }

  Future<void> getQrMenu() async {
    String accessToken = db.getAccessToken()!;

    final response = await api.getQrMenu(accessToken);
    response.handleResponse(
      onSuccess: (result) async {
        result as QrCode;

        qrMenu.assignAll(result.results!);
      },
    );
  }

  Future<void> logout() async {
    await db.clearSession();
    Get.offAllNamed(
      SignInPage.routeName,
      predicate: (route) => route.settings.name == WelcomePage.routeName,
    );
  }
}
