import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../../../utils/utils.dart';
import '../../pages.dart';

class EmailVerificationPage extends GetView<EmailVerificationController> {
  static const String routeName = '/email-verification';

  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      singleLineTitle: true,
      body: [
        const Material(
          shape: CircleBorder(),
          color: AppColors.secondaryOrange,
          child: Padding(
            padding: PaddingSizes.medium,
            child: Icon(
              Icons.email,
              color: Colors.white,
              size: 40.0,
            ),
          ),
        ),
        const Spacing.large(),
        Text(
          'Verify your email',
          style: Get.textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        const Spacing.small(),
        Text(
          'You have not verified your email below',
          style: Get.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const Spacing.small(),
        Text(
          controller.accountInVerification!,
          style: Get.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const Spacing.xlarge(),
        Text(
          'Please check your email inbox to get the verification code',
          style: Get.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const Spacing.xlarge(),
        AppButton.compact(
          onPressed: () => Get.toNamed(OTPInputPage.routeName),
          label: 'Input verification code',
        ),
        const Spacing.small(),
        TextButton(
          onPressed: () => Get.toNamed(EmailChangePage.routeName),
          child: Text('Change email address', style: Get.textTheme.bodyLarge),
        )
      ],
    );
  }
}
