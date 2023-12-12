import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import 'components.dart';

class PageLayout extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showBackButton;
  final bool singleLineTitle;
  final List<Widget> body;
  final Widget? callToAction;

  const PageLayout({
    super.key,
    required this.title,
    this.subtitle,
    this.showBackButton = true,
    this.singleLineTitle = false,
    required this.body,
    this.callToAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(
                16.0,
                Get.mediaQuery.padding.top + 16.0,
                16.0,
                Get.mediaQuery.padding.bottom + 32.0,
              ),
              children: [
                TitleBar(
                  title: title,
                  subtitle: subtitle,
                  showBackButton: showBackButton,
                  singleLine: singleLineTitle,
                ),
                const Spacing.large(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: body,
                  ),
                ),
              ],
            ),
          ),
          if (callToAction != null)
            Padding(
              padding: PaddingSizes.page,
              child: callToAction!,
            ),
        ],
      ),
    );
  }
}
