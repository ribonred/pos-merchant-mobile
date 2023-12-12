import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool outlined;
  final Widget? leading;
  final Widget? trailing;
  final int? proceedDelay;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool compact;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.outlined = false,
    this.leading,
    this.trailing,
    this.proceedDelay,
    this.backgroundColor = AppColors.primaryOrange,
    this.foregroundColor = Colors.white,
    this.compact = false,
  });

  const AppButton.compact({
    super.key,
    required this.onPressed,
    required this.label,
    this.outlined = false,
    this.leading,
    this.trailing,
    this.proceedDelay,
    this.backgroundColor = AppColors.primaryOrange,
    this.foregroundColor = Colors.white,
    this.compact = true,
  });

  const AppButton.outlined({
    super.key,
    required this.onPressed,
    required this.label,
    this.outlined = true,
    this.leading,
    this.trailing,
    this.proceedDelay,
    this.backgroundColor = Colors.transparent,
    this.foregroundColor = AppColors.primaryOrange,
    this.compact = false,
  });

  const AppButton.outlinedCompact({
    super.key,
    required this.onPressed,
    required this.label,
    this.outlined = true,
    this.leading,
    this.trailing,
    this.proceedDelay,
    this.backgroundColor = Colors.transparent,
    this.foregroundColor = AppColors.primaryOrange,
    this.compact = true,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding =
        compact ? PaddingSizes.buttonSmall : PaddingSizes.button;
    TextStyle? textStyle = (compact
            ? Theme.of(context).textTheme.titleLarge
            : Theme.of(context).textTheme.headlineMedium)
        ?.copyWith(fontWeight: FontWeight.w600);
    List<Widget> labelWidgetItems = [
      if (leading != null) leading!,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(label),
      ),
      if (trailing != null) trailing!,
    ];

    if (proceedDelay != null) {
      // replace last item in labelWidgetItems
      if (trailing != null) labelWidgetItems.removeLast();

      labelWidgetItems.add(
        TweenAnimationBuilder<Duration>(
          duration: Duration(seconds: proceedDelay!),
          tween: Tween(
            begin: Duration(seconds: proceedDelay!),
            end: Duration.zero,
          ),
          onEnd: onPressed,
          builder: (BuildContext context, Duration value, Widget? child) {
            double progress = clampDouble(
              (proceedDelay! - value.inSeconds) / proceedDelay!,
              0.0,
              1.0,
            );

            return SizedBox(
              height: 18.0,
              width: 18.0,
              child: CircularProgressIndicator(
                value: progress,
                color: foregroundColor,
              ),
            );
          },
        ),
      );
    }

    return outlined
        ? OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: padding,
              side: BorderSide(color: foregroundColor, width: 2.0),
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              textStyle: textStyle,
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: labelWidgetItems,
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: padding,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              textStyle: textStyle,
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: labelWidgetItems,
            ),
          );
  }
}
