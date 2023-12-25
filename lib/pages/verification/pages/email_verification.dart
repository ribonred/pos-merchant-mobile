import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../components/components.dart';
import '../../../utils/utils.dart';
import '../verification.dart';

class EmailVerificationPage extends GetView<EmailVerificationController> {
  static const routeName = '/email-verification';

  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    const defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusSizes.medium,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12.0,
            offset: Offset(0, 5),
          )
        ],
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primaryOrange, width: 2),
      borderRadius: BorderRadiusSizes.medium,
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: PageLayout(
        title: 'Email verification',
        body: [
          Text(
            'Please enter the code we just sent to your email',
            style: Get.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const Spacing.small(),
          __buildEmailAddress(),
          const Spacing.xlarge(),
          Pinput(
            autofocus: true,
            readOnly: true,
            length: 6,
            controller: controller.codeController,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            cursor: Text(
              '|',
              style: defaultPinTheme.textStyle
                  ?.copyWith(color: AppColors.primaryOrange),
            ),
          ),
          const Spacing.large(),
          RichText(
            text: TextSpan(
              text: 'Did not receive the code? ',
              children: [
                TextSpan(
                  text: 'Resend',
                  style: const TextStyle(color: AppColors.primaryOrange),
                  recognizer: TapGestureRecognizer()
                    ..onTap = controller.resendCode,
                ),
              ],
              style: Get.textTheme.bodySmall,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacing(),
          GetBuilder<EmailVerificationController>(builder: (controller) {
            return AppButton.compact(
              onPressed: controller.isComplete ? controller.submitCode : null,
              label: 'Continue',
            );
          }),
          _buildNumberPad(),
        ],
      ),
    );
  }

  Widget _buildNumberPad() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: PaddingSizes.zero,
      crossAxisCount: 3,
      children: List.generate(
        12,
        (index) {
          final number = index + 1;
          String label = number.toString();
          VoidCallback? action = () => controller.appendCode(label);

          switch (index) {
            case 9:
              label = '';
              action = null;
              break;
            case 10:
              label = '0';
              action = () => controller.appendCode('0');
              break;
            case 11:
              label = '⌫';
              action = controller.deleteCode;
              break;
          }

          return TextButton(
            style: const ButtonStyle(
              foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
              visualDensity: VisualDensity.compact,
              padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
            ),
            onPressed: action,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget __buildEmailAddress() {
    if (controller.accountInVerification == null) return const SizedBox();

    String account = controller.accountInVerification!.split('@')[0];
    String domain = controller.accountInVerification!.split('@')[1];
    int visibleLength = ((1 / 3) * account.length).floor();

    account = account.replaceRange(
      visibleLength,
      account.length,
      '*' * (account.length - visibleLength),
    );

    return Text(
      '$account@$domain',
      style: Get.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }
}
