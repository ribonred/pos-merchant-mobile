import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/pages.dart';
import '../services/services.dart';

class SessionMiddleware extends GetMiddleware {
  final DatabaseService db = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    final accessToken = db.getAccessToken();
    final hasSessionId = accessToken != null && accessToken != '';
    final isInVerification = db.isInVerificationProcess;

    switch (route) {
      case initialRoute:
        if (hasSessionId) {
          return const RouteSettings(name: HomePage.routeName);
        } else if (isInVerification) {
          return const RouteSettings(name: EmailVerificationPage.routeName);
        }
        break;
      case EmailVerificationPage.routeName:
        if (!isInVerification) {
          return const RouteSettings(name: initialRoute);
        }
        break;
    }

    return null;
  }
}
