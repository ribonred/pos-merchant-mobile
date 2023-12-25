import 'package:get/get.dart';

import '../middlewares/middlewares.dart';
import 'home/home.dart';
import 'sign_in/sign_in.dart';
import 'sign_up/sign_up.dart';
import 'verification/verification.dart';
import 'welcome/welcome.dart';

export 'home/home.dart';
export 'sign_in/sign_in.dart';
export 'sign_up/sign_up.dart';
export 'verification/verification.dart';
export 'welcome/welcome.dart';

const String initialRoute = WelcomePage.routeName;
List<GetPage> appPages = [
  GetPage(
    name: WelcomePage.routeName,
    page: () => const WelcomePage(),
    middlewares: [SessionMiddleware()],
  ),
  GetPage(
    name: SignUpPage.routeName,
    page: () => const SignUpPage(),
    binding: SignUpBinding(),
  ),
  GetPage(
    name: EmailVerificationPage.routeName,
    page: () => const EmailVerificationPage(),
    middlewares: [SessionMiddleware()],
    binding: EmailVerificationBinding(),
  ),
  GetPage(
    name: SignInPage.routeName,
    page: () => const SignInPage(),
    binding: SignInBinding(),
  ),
  GetPage(
    name: HomePage.routeName,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),
];
