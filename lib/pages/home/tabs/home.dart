import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';

class HomeTab extends GetView<HomeController> {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, GetPageRoute> pages = {
      '/': GetPageRoute(page: () => const HomeSubPage()),
      '/menu': GetPageRoute(page: () => const QrMenuSubPage()),
    };

    return Navigator(
      key: Get.nestedKey(1),
      initialRoute: '/',
      onGenerateRoute: (settings) => pages[settings.name],
    );
  }
}
