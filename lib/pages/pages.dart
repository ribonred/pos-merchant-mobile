import 'package:get/get.dart';

import 'home/home.dart';
import 'sign_in/sign_in.dart';
import 'welcome/welcome.dart';

export 'home/home.dart';
export 'sign_in/sign_in.dart';
export 'welcome/welcome.dart';

List<GetPage> appPages = [
  GetPage(name: WelcomePage.routeName, page: () => const WelcomePage()),
  GetPage(name: SignInPage.routeName, page: () => const SignInPage()),
  GetPage(name: HomePage.routeName, page: () => const HomePage()),
];
