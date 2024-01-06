import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../../../utils/utils.dart';
import '../components/components.dart';
import '../home.dart';

class HomeSubPage extends StatelessWidget {
  const HomeSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> items = [
      {
        'icon': Icons.menu_book,
        'title': 'Menu',
        'page': const PageLayout(
          title: 'Menu',
          singleLineTitle: true,
          body: [],
        )
      },
      {
        'icon': Icons.favorite_border,
        'title': 'Promos',
        'page': const PageLayout(
          title: 'Promos',
          singleLineTitle: true,
          body: [],
        )
      },
      {
        'icon': Icons.payment,
        'title': 'Payments',
        'page': const PageLayout(
          title: 'Payments',
          singleLineTitle: true,
          body: [],
        )
      },
    ];

    return PageLayout(
      nestedNavigationIndex: 1,
      title: 'Halo Nama Toko yang panjang',
      showBackButton: false,
      singleLineTitle: true,
      withScaffold: false,
      body: [
        MenuItemContainer(
          icon: const Icon(Icons.monetization_on),
          children: [
            const Text(
              'Total sales for the day',
              style: TextStyle(color: Colors.white),
            ),
            GetX<HomeController>(
              builder: (controller) => Text(
                'Rp. ${controller.totalSales.value}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ],
        ),
        const Spacing(),
        MenuItemContainer(
          icon: const Icon(Icons.shopping_cart),
          showArrow: true,
          children: [
            const Text(
              'Today you have',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RichText(
                text: TextSpan(
                  text: '0',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                  children: [
                    TextSpan(
                      text: ' paid orders',
                      style: Get.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Spacing.small(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RichText(
                text: TextSpan(
                  text: '0',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                  children: [
                    TextSpan(
                      text: ' unpaid orders',
                      style: Get.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        const Spacing(),
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: PaddingSizes.small,
              child: Text(
                '0 orders',
                style: Get.textTheme.titleMedium,
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        const Spacing(),
        ListView.separated(
          shrinkWrap: true,
          padding: PaddingSizes.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return MenuItemContainer(
              onTap: () => Get.to(() => item['page'] as Widget, id: 1),
              icon: Icon(item['icon']),
              children: [
                Text(
                  item['title'],
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const Spacing(),
        ),
      ],
    );
  }
}
