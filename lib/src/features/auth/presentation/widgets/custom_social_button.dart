import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: onTap,
          child: BlocBuilder<ThemesCubit, ThemeData>(
            builder: (context, state) {
              return Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: state.brightness == Brightness.light
                      ? Colors.white
                      : AppColors.darkHeaderClr,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.socialIconsBorderColor,
                    width: 1.94,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(icon),
                ),
              );
            },
          ),
        ),
        Text(
          title,
          style: AppTextStyles.textStyle15.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
