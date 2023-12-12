import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../utils/utils.dart';
import '../pages.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = '/welcome';

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryOrange,
      body: Padding(
        padding: PaddingSizes.page,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                child: Image.asset(
                  AssetIcons.icon,
                  width: 3 / 4 * Get.width,
                  height: 3 / 4 * Get.width,
                ),
              ),
              const Spacing.large(),
              RichText(
                text: TextSpan(
                  text: 'Your\n',
                  children: const [
                    TextSpan(
                      text: 'POS Solution',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        height: 1.3,
                      ),
                ),
                textAlign: TextAlign.center,
              ),
              const Spacing(
                vspace: 100.0,
              ),
              AppButton(
                onPressed: () => Get.toNamed(SignInPage.routeName),
                label: 'Sign in',
                trailing: const Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ),
      ),
    );
  }
}
