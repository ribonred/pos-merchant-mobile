import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool singleLine;
  final bool showBackButton;

  const TitleBar({
    super.key,
    required this.title,
    this.subtitle,
    this.singleLine = false,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget backButton = IconButton(
      onPressed: () => Get.back(),
      tooltip: 'Back',
      padding: const EdgeInsets.only(right: 8.0),
      icon: const Icon(Icons.arrow_back_ios_new),
    );
    Widget titleWidget = Padding(
      padding: singleLine ? EdgeInsets.zero : const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          if (subtitle != null) ...[
            if (!singleLine) const Spacing.small(),
            Text(subtitle!, style: Theme.of(context).textTheme.titleSmall)
          ],
        ],
      ),
    );
    List<Widget> titleWidgetItems = [
      if (showBackButton)
        Align(
          alignment: Alignment.centerLeft,
          child: backButton,
        )
      else
        const Spacing(),
      titleWidget,
    ];

    return singleLine
        ? Row(children: titleWidgetItems)
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: titleWidgetItems,
          );
  }
}
