import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/pages.dart';
import '../services/services.dart';

class SessionMiddleware extends GetMiddleware {
  final DatabaseService db = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    String? accessToken = db.getAccessToken();
    bool hasSessionId = accessToken != null && accessToken != '';

    String routeName = route == WelcomePage.routeName
        ? HomePage.routeName
        : WelcomePage.routeName;

    return hasSessionId ? RouteSettings(name: routeName) : null;
  }
}
