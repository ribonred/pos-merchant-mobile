import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../../../utils/utils.dart';
import '../home.dart';

class QrMenuPage extends StatelessWidget {
  const QrMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: 'QR Code',
      singleLineTitle: true,
      body: [
        GetX<HomeController>(
          builder: (controller) {
            if (controller.qrMenu.isEmpty) {
              return const Center(
                child: Text('No QR code found'),
              );
            }

            return CachedNetworkImage(
              imageUrl: controller.qrMenu.first!.barcodeImage!,
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryOrange,
                  value: progress.progress,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
