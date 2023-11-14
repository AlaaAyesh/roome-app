import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.child,
    required this.height,
    this.personalErrorHeight,
    this.contactErrorHeight,
    this.isPersonalValidateError = false,
    this.isContactValidateError = false,
  });

  final double height;
  final double? personalErrorHeight;
  final double? contactErrorHeight;
  final Widget child;
  final bool isPersonalValidateError;
  final bool isContactValidateError;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          height: isPersonalValidateError
              ? personalErrorHeight
              : isContactValidateError
                  ? contactErrorHeight
                  : height.h,
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.only(
            top: 20.h,
            bottom: 20.h,
            left: 20.w,
            right: 9.w,
          ),
          decoration: BoxDecoration(
            color: state.brightness == Brightness.light
                ? Colors.white
                : AppColors.darkGreyColor,
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            border: Border.all(
              color: HexColorHandler('D9D9D9').withOpacity(0.37),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(0, 4.h),
                blurRadius: 4.w,
                color: Colors.black.withOpacity(0.25),
              ),
            ],
          ),
          child: child,
        );
      },
    );
  }
}
