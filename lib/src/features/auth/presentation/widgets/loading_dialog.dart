import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ThemesCubit, ThemeData>(
        builder: (context, state) {
          return Container(
            height: 70.h,
            width: 70.h,
            decoration: BoxDecoration(
              color: state.brightness == Brightness.light
                  ? Colors.white
                  : AppColors.darkGreyColor,
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
            ),
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
                backgroundColor: state.brightness == Brightness.light
                    ? Colors.white
                    : AppColors.darkGreyColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
