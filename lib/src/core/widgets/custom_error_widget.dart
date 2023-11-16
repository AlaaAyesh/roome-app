import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    this.onPressed,
    required this.error,
  });

  final VoidCallback? onPressed;
  final String error;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Icon(
                Icons.warning,
                color: AppColors.primaryColor,
                size: 150,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Flexible(
                child: Text(
                  error,
                  style: AppTextStyles.hintStyle.copyWith(
                    color: state.brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 15),
            MyCustomButton(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              height: 50,
              width: double.infinity,
              backgroundColor: AppColors.primaryColor,
              elevation: 500,
              onPressed: () {
                if (onPressed != null) onPressed!();
              },
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
          ],
        );
      },
    );
  }
}
