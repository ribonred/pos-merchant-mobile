import 'package:flutter/material.dart';

import '../../../components/components.dart';
import '../../../utils/utils.dart';

class MenuItemContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget icon;
  final List<Widget> children;
  final bool showBackgroundImage;
  final bool showArrow;

  const MenuItemContainer({
    super.key,
    this.onTap,
    required this.icon,
    required this.children,
    this.showBackgroundImage = false,
    this.showArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: PaddingSizes.medium,
        decoration: const BoxDecoration(
          color: AppColors.primaryOrange,
          borderRadius: BorderRadiusSizes.medium,
          boxShadow: [
            BoxShadow(
              blurRadius: 6.0,
              color: Colors.black38,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: IconTheme(
                data: const IconThemeData(color: Colors.white, size: 48.0),
                child: icon,
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 48.0),
                child: Row(
                  children: [
                    const Spacing.horizontalSmall(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: children,
                      ),
                    ),
                    if (showArrow)
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
