import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/features/auth/sign_in/presentation/cubit/login_cubit.dart';

class RememberMeCheckBox extends StatelessWidget {
  final LoginCubit cubit;

  const RememberMeCheckBox({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => cubit.switchRemembered(),
      child: Container(
        height: 15.w,
        width: 15.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 0.56.w,
          ),
        ),
        child: Center(
          child: cubit.remembered
              ? Icon(
                  Icons.check,
                  color: AppColors.primaryColor,
                  size: 13.w,
                )
              : null,
        ),
      ),
    );
  }
}
