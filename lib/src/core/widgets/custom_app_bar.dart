import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/get_back_arrow.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.spaceBetween,
    required this.title,
    required this.arrowOnTap,
  });

  final double spaceBetween;
  final VoidCallback arrowOnTap;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GetBackArrow(onTap: arrowOnTap),
        SizedBox(width: spaceBetween.w),
        BlocBuilder<ThemesCubit, ThemeData>(
          builder: (context, state) {
            return Text(
              title,
              style: state.brightness == Brightness.light
                  ? AppTextStyles.appBarTextStyle
                  : AppTextStyles.appBarTextStyle.copyWith(
                      color: Colors.white,
                    ),
            );
          },
        ),
      ],
    );
  }
}
