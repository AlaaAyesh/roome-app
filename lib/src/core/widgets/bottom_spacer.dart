import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSpacer extends StatelessWidget {
  const BottomSpacer({super.key, this.height = 16});

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height?.h);
  }
}
