import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../utils/utils.dart';
import '../pages.dart';

class SignUpPage extends GetView<SignUpController> {
  static const routeName = '/sign-up';

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: PageLayout(
        title: 'Sign up',
        subtitle: 'Create your account',
        body: [
          AppTextInput(
            labelText: 'Name',
            hintText: 'Your store or restaurant name',
            textInputAction: TextInputAction.next,
            onChanged: (value) => controller.name.value = value,
          ),
          const Spacing(),
          AppTextInput(
            labelText: 'Email',
            hintText: 'Your email',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onChanged: (value) => controller.email.value = value,
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
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: visible.value,
              onChanged: (value) => controller.password.value = value,
              onSubmitted: (_) => controller.signUp(),
            ),
            true.obs,
          ),
          const Spacing(),
          AppButton.compact(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              controller.signUp();
            },
            label: 'Register',
          ),
          const Spacing(),
          RichText(
            text: TextSpan(
              text: 'Already have an account? ',
              children: [
                TextSpan(
                  text: 'Sign in',
                  style: const TextStyle(color: AppColors.primaryOrange),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed(SignInPage.routeName),
                ),
              ],
              style: Theme.of(context).textTheme.bodySmall,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
