import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../../../utils/utils.dart';
import '../home.dart';

class HomePage extends GetView<HomeController> {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> items = [
      {'icon': Icons.qr_code, 'title': 'Show QR', 'page': const QrMenuPage()},
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
        'icon': Icons.list_alt,
        'title': 'Order list',
        'page': const PageLayout(
          title: 'Orders',
          singleLineTitle: true,
          body: [],
        )
      },
      {
        'icon': Icons.payments,
        'title': 'Payments',
        'page': const PageLayout(
          title: 'Payments',
          singleLineTitle: true,
          body: [],
        )
      },
    ];

    return PageLayout(
      title: 'Halo Nama Toko yang panjang',
      showBackButton: false,
      singleLineTitle: true,
      actions: [
        IconButton(
          onPressed: () => controller.logout(),
          icon: const Icon(Icons.logout),
        )
      ],
      body: [
        Container(
          padding: PaddingSizes.medium,
          decoration: const BoxDecoration(
            color: AppColors.primaryOrange,
            borderRadius: BorderRadiusSizes.small,
            boxShadow: [
              BoxShadow(
                blurRadius: 6.0,
                color: Colors.black38,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Row(
            children: [
              const Icon(
                Icons.monetization_on,
                color: Colors.white,
                size: 48.0,
              ),
              const Spacing.horizontalSmall(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
            ],
          ),
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
        GridView.builder(
          shrinkWrap: true,
          padding: PaddingSizes.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 32.0,
            childAspectRatio: 0.9,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OpenContainer<bool>(
                  closedColor: AppColors.secondaryOrange,
                  closedElevation: 8.0,
                  closedShape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusSizes.medium,
                  ),
                  closedBuilder: (context, open) => Padding(
                    padding: PaddingSizes.large,
                    child: Icon(
                      item['icon'],
                      color: Colors.white,
                      size: 86.0,
                    ),
                  ),
                  openBuilder: (context, close) => item['page'],
                ),
                const Spacing.small(),
                Text(
                  item['title'],
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
