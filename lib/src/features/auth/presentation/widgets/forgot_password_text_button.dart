import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class ForgotPasswordTextButton extends StatelessWidget {
  const ForgotPasswordTextButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        'Forgot Password?',
        style: AppTextStyles.textStyle14Medium,
      ),
    );
  }
}
