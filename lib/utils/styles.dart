import 'package:flutter/material.dart';

class PaddingSizes {
  static const EdgeInsets zero = EdgeInsets.zero;
  static const EdgeInsets xsmall = EdgeInsets.all(4.0);
  static const EdgeInsets small = EdgeInsets.all(8.0);
  static const EdgeInsets medium = EdgeInsets.all(16.0);
  static const EdgeInsets large = EdgeInsets.all(32.0);

  static const EdgeInsets page = EdgeInsets.all(32.0);

  static const button = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 16.0,
  );
  static const buttonSmall = EdgeInsets.symmetric(
    horizontal: 8.0,
    vertical: 8.0,
  );
}

class BorderRadiusSizes {
  static const BorderRadius small = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius medium = BorderRadius.all(Radius.circular(16.0));
  static const BorderRadius large = BorderRadius.all(Radius.circular(32.0));
}
