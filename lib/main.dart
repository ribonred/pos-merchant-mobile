import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await initServices();
  runApp(const POSApp());
}

Future initServices() async {
  if (kDebugMode) print('Starting services...');

  await Get.putAsync(() => DatabaseService().init());
  await Get.putAsync(() => NotificationService().init());

  if (kDebugMode) print('Services started.');
}
