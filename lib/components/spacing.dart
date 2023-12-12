import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double hspace;
  final double vspace;

  const Spacing({
    super.key,
    this.hspace = 0.0,
    this.vspace = 16.0,
  });

  const Spacing.xsmall({super.key})
      : hspace = 0.0,
        vspace = 4.0;

  const Spacing.small({super.key})
      : hspace = 0.0,
        vspace = 8.0;

  const Spacing.large({super.key})
      : hspace = 0.0,
        vspace = 24.0;

  const Spacing.xlarge({super.key})
      : hspace = 0.0,
        vspace = 32.0;

  const Spacing.xxlarge({super.key})
      : hspace = 0.0,
        vspace = 48.0;

  const Spacing.horizontal({super.key})
      : hspace = 16.0,
        vspace = 0.0;

  const Spacing.horizontalXsmall({super.key})
      : hspace = 4.0,
        vspace = 0.0;

  const Spacing.horizontalSmall({super.key})
      : hspace = 8.0,
        vspace = 0.0;

  const Spacing.horizontalLarge({super.key})
      : hspace = 24.0,
        vspace = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: vspace, width: hspace);
  }
}
