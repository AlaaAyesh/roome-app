import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.onPressed,
    required this.error,
  });

  final VoidCallback onPressed;
  final String error;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const Center(
              child: Icon(
                Icons.refresh,
                color: AppColors.primaryColor,
                size: 150,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Flexible(
                child: Text(
                  error == AppStrings.noInternet ? '$error. Tap to try' : error,
                  style: AppTextStyles.hintStyle.copyWith(
                    color: state.brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (error == AppStrings.noInternet) ...[
              Text(
                'Connect to the internet and try again.',
                style: AppTextStyles.textStyle12,
                textAlign: TextAlign.center,
              ),
            ],
            const Spacer(),
            MyCustomButton(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              height: 50,
              width: 250,
              backgroundColor: AppColors.primaryColor,
              onPressed: onPressed,
              hasPrefix: false,
              child: Center(
                child: Text(
                  'Try again',
                  style: AppTextStyles.appBarTextStyle.copyWith(
                    color: state.brightness == Brightness.light
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        );
      },
    );
  }
}
