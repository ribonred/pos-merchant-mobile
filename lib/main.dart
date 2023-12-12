import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  await initServices();
  runApp(const POSApp());
}

Future initServices() async {
  if (kDebugMode) print('Starting services...');

  if (kDebugMode) print('Services started.');
}
