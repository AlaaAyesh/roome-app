import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../utils/app_colors.dart';

class AuthLoadingDialog extends StatelessWidget {
  const AuthLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 70.w,
        width: 70.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        child: Center(
          child: CustomCircularProgressIndicator(
            color: AppColors.primaryColor,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
