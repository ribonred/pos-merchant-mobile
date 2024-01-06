import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import 'home.dart';

class HomePage extends GetView<HomeController> {
  static const String routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map> tabItems = [
      {
        'icon': Icons.home_outlined,
        'activeIcon': Icons.home,
        'tab': const HomeTab(),
      },
      {
        'icon': Icons.search_outlined,
        'activeIcon': Icons.search,
        'tab': const SearchTab(),
      },
      {
        'icon': Icons.logout_outlined,
        'activeIcon': Icons.login_outlined,
        'tab': const SizedBox(),
      },
    ];

    void onTapNavigation(int index) {
      switch (index) {
        case 2:
          controller.logout();
          break;
        default:
          controller.currentIndex.value = index;
      }
    }

    return GetX<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryOrange,
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32.0),
                    bottomRight: Radius.circular(32.0),
                  ),
                ),
              ),
              AnimatedSwitcher(
                child: tabItems[controller.currentIndex.value]['tab'],
                duration: const Duration(milliseconds: 300),
              )
            ],
          ),
          bottomNavigationBar: Container(
            color: AppColors.primaryOrange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: tabItems.map(
                (e) {
                  int currentIndex = controller.currentIndex.value;
                  int tabIndex = tabItems.indexOf(e);

                  return _buildNavigationIcon(
                    icon: e['icon'],
                    activeIcon: e['activeIcon'],
                    onPressed: () => onTapNavigation(tabIndex),
                    isActive: currentIndex == tabIndex,
                  );
                },
              ).toList(),
            ),
          ),
        );
      },
    );
  }

  IconButton _buildNavigationIcon({
    required VoidCallback onPressed,
    required IconData icon,
    required IconData activeIcon,
    bool isActive = false,
  }) {
    return IconButton(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      onPressed: onPressed,
      icon: Icon(isActive ? activeIcon : icon),
      color: Colors.white,
    );
  }
}
