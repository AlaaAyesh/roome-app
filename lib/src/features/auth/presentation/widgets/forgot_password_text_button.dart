import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class ForgotPasswordTextButton extends StatelessWidget {
  const ForgotPasswordTextButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onTap: onTap,
      child: Text(
        'Forgot Password?',
        style: AppTextStyles.textStyle14Medium,
      ),
    );
  }
}
