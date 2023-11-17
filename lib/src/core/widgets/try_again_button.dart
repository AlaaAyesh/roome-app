import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/my_custom_button.dart';

class TryAgainButton extends StatelessWidget {
  const TryAgainButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyCustomButton(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        height: 45,
        width: 200,
        backgroundColor: AppColors.primaryColor,
        elevation: 500,
        onPressed: onPressed,
        hasPrefix: false,
        child: Center(
          child: Text(
            'Try again',
            style: AppTextStyles.textStyle15.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
