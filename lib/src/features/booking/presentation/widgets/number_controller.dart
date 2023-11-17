import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_colors.dart';

class NumberController extends StatelessWidget {
  const NumberController({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31,
      width: 35,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.17),
        borderRadius: const BorderRadius.all(Radius.circular(7)),
      ),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Icon(
            icon,
            color: AppColors.primaryColor.withOpacity(0.74),
            size: 20,
          ),
        ),
      ),
    );
  }
}
