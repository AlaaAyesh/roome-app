import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_colors.dart';

class StarIcon extends StatelessWidget {
  const StarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.star,
      color: AppColors.starColor,
      size: 16,
    );
  }
}
