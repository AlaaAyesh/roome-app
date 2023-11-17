import 'package:flutter/material.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/my_custom_button.dart';

class GlowingCustomButton extends StatelessWidget {
  const GlowingCustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return MyCustomButton(
      onPressed: onPressed,
      height: 50,
      width: 148,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      backgroundColor: AppColors.primaryColor,
      boxShadow: [
        Helper.glowingShadow(),
      ],
      hasPrefix: false,
      child: Center(
        child: Text(
          buttonText,
          style: AppTextStyles.textStyle15.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
