import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final bool singleLine;
  final bool showBackButton;

  const TitleBar({
    super.key,
    required this.title,
    this.subtitle,
    this.actions,
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
    Widget titleText = AutoSizeText(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(fontWeight: FontWeight.w600),
      maxLines: 1,
    );
    Widget titleWidget = Padding(
      padding: singleLine && showBackButton
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 16.0),
      // padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (singleLine && actions != null)
            // Row(children: [titleText, const Spacer(), ...actions!])
            titleText
          else
            titleText,
          if (subtitle != null) ...[
            if (!singleLine) const Spacing.small(),
            Text(subtitle!, style: Theme.of(context).textTheme.titleSmall)
          ],
        ],
      ),
    );
    Widget topRow = Row(
      children: [
        if (showBackButton) backButton,
        if (singleLine) Expanded(child: titleWidget) else const Spacer(),
        if (actions != null) ...actions!,
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        topRow,
        if (!singleLine) ...[const Spacing(), titleWidget],
      ],
    );
  }
}
