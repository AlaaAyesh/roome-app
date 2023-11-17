import 'package:flutter/material.dart';

class BottomSpacer extends StatelessWidget {
  const BottomSpacer({super.key, this.height = 24});

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
