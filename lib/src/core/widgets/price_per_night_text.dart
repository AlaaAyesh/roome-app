import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/hex_color_handler.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class PricePerNightText extends StatelessWidget {
  const PricePerNightText({
    super.key,
    this.fontSize,
    this.mainAxisAlignment,
    this.price,
  });

  final double? price;
  final double? fontSize;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.end,
          children: <Widget>[
            Text(
              price!.toStringAsFixed(1),
              style: AppTextStyles.bottomNavTextStyle.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w900,
                color: state.brightness == Brightness.light
                    ? Colors.black.withOpacity(0.6)
                    : Colors.white,
              ),
            ),
            Text(
              '/night',
              style: AppTextStyles.bottomNavTextStyle.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w900,
                color: state.brightness == Brightness.light
                    ? HexColorHandler('4E4C4C').withOpacity(0.53)
                    : AppColors.white38,
              ),
            ),
          ],
        );
      },
    );
  }
}
