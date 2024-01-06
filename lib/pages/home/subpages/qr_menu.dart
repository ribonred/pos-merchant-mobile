import 'package:flutter/material.dart';

import '../../../components/components.dart';

class QrMenuSubPage extends StatelessWidget {
  const QrMenuSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageLayout(
      nestedNavigationIndex: 1,
      title: 'QR Code',
      singleLineTitle: true,
      body: [
        // GetX<HomeController>(
        //   builder: (controller) {
        //     if (controller.qrMenu.isEmpty) {
        //       return const Center(
        //         child: Text('No QR code found'),
        //       );
        //     }

        //     return CachedNetworkImage(
        //       imageUrl: controller.qrMenu.first!.barcodeImage!,
        //       progressIndicatorBuilder: (context, url, progress) => Center(
        //         child: CircularProgressIndicator(
        //           color: AppColors.primaryOrange,
        //           value: progress.progress,
        //         ),
        //       ),
        //     );
        //   },
        // )
      ],
    );
  }
}
