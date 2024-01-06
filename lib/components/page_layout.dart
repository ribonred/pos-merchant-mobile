import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import 'components.dart';

class PageLayout extends StatelessWidget {
  final int? nestedNavigationIndex;
  final String? title;
  final String? subtitle;
  final bool showBackButton;
  final bool singleLineTitle;
  final bool withScaffold;
  final List<Widget>? actions;
  final List<Widget> body;
  final Widget? callToAction;

  const PageLayout({
    super.key,
    this.nestedNavigationIndex,
    this.title,
    this.subtitle,
    this.showBackButton = true,
    this.singleLineTitle = false,
    this.withScaffold = true,
    this.actions,
    required this.body,
    this.callToAction,
  });

  @override
  Widget build(BuildContext context) {
    Widget page = Column(
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
                nestedNavigationIndex: nestedNavigationIndex,
                title: title,
                subtitle: subtitle,
                actions: actions,
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
    );

    return withScaffold ? Scaffold(body: page) : page;
  }
}
