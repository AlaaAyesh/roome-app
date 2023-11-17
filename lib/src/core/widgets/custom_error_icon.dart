import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_colors.dart';

class CustomErrorIcon extends StatelessWidget {
  const CustomErrorIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.error,
      size: 22,
      color: AppColors.primaryColor,
    );
  }
}
