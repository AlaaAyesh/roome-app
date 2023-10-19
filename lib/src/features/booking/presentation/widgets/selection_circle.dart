import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/core/utils/app_colors.dart';

class SelectionCircle extends StatefulWidget {
  const SelectionCircle({super.key});

  @override
  State<SelectionCircle> createState() => _SelectionCircleState();
}

class _SelectionCircleState extends State<SelectionCircle> {
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (color == Colors.white) {
          setState(() {
            color = AppColors.primaryColor;
          });
        } else {
          setState(() {
            color = Colors.white;
          });
        }
      },
      child: Container(
        height: 20.w,
        width: 20.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(color: AppColors.primaryColor, width: 2.w),
        ),
      ),
    );
  }
}
