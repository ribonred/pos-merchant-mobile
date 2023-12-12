import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../../utils/utils.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> items = [
      {
        'icon': Icons.qr_code,
        'title': 'Show QR',
        'page': const PageLayout(
          title: 'QR Code',
          singleLineTitle: true,
          body: [],
        )
      },
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
      title: 'Halo Nama Toko',
      showBackButton: false,
      body: [
        GridView.builder(
          shrinkWrap: true,
          padding: PaddingSizes.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Column(
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
                      size: 64.0,
                    ),
                  ),
                  openBuilder: (context, close) => item['page'],
                ),
                const Spacing.small(),
                Text(
                  item['title'],
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            );
          },
        )
      ],
      callToAction: Container(
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
            ]),
        child: const Row(
          children: [
            Icon(
              Icons.monetization_on,
              color: Colors.white,
              size: 48.0,
            ),
            Spacing.horizontalSmall(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total sales for the day',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Rp. 0',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
