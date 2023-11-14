import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title, icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: BlocBuilder<ThemesCubit, ThemeData>(
            builder: (context, state) {
              return Container(
                height: 48.w,
                width: 48.w,
                decoration: BoxDecoration(
                  color: state.brightness == Brightness.light
                      ? Colors.white
                      : AppColors.darkHeaderClr,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: AppColors.socialIconsBorderColor,
                    width: 1.94.w,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(icon),
                ),
              );
            },
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.004),
        Text(
          title,
          style: AppTextStyles.textStyle15.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
