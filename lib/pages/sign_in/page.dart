import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../utils/utils.dart';
import '../pages.dart';

class SignInPage extends StatelessWidget {
  static const routeName = '/sign-in';

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: PageLayout(
        title: 'Sign in',
        subtitle: 'Sign in to your account',
        body: [
          const AppTextInput(
            labelText: 'Email',
            hintText: 'Your email',
            keyboardType: TextInputType.emailAddress,
          ),
          const Spacing(),
          ObxValue<RxBool>(
            (visible) => AppTextInput(
              labelText: 'Password',
              hintText: 'Your password',
              suffixIcon: IconButton(
                onPressed: visible.toggle,
                icon: Icon(
                  visible.value ? Icons.visibility : Icons.visibility_off,
                ),
              ),
              obscureText: visible.value,
            ),
            true.obs,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {},
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
                foregroundColor: MaterialStatePropertyAll<Color>(
                  AppColors.primaryOrange,
                ),
              ),
              child: const Text('Forgot password?'),
            ),
          ),
          const Spacing.small(),
          AppButton.compact(
            onPressed: () => Get.offAllNamed(HomePage.routeName),
            label: 'Log in',
          ),
          const Spacing(),
          RichText(
            text: TextSpan(
              text: 'Don\'t have an account? ',
              children: [
                TextSpan(
                  text: 'Sign up',
                  style: const TextStyle(color: AppColors.primaryOrange),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
              style: Theme.of(context).textTheme.bodySmall,
            ),
            textAlign: TextAlign.center,
          ),
          // const Spacing.large(),
          // const Row(
          //   children: [
          //     Expanded(child: Divider()),
          //     Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 8.0),
          //       child: Text('Or with'),
          //     ),
          //     Expanded(child: Divider()),
          //   ],
          // ),
          // const Spacing.large(),
          // AppButton.outlinedCompact(
          //   onPressed: () {},
          //   leading: const Icon(Icons.abc),
          //   label: 'Sign in with Google',
          // ),
          // const Spacing.small(),
          // AppButton.outlinedCompact(
          //   onPressed: () {},
          //   leading: const Icon(Icons.phone),
          //   label: 'Sign in with phone number',
          // ),
        ],
      ),
    );
  }
}
