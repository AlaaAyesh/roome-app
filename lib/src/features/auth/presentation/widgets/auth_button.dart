import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/my_custom_button.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
  });

  final String buttonTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: MyCustomButton(
        height: 47,
        width: double.infinity,
        onPressed: onPressed,
        hasPrefix: false,
        backgroundColor: AppColors.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Center(
          child: Text(
            buttonTitle,
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
