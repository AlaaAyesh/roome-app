import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Sign up',
          style: AppTextStyle.splashTextStyle,
        ),
      ),
    );
  }
}
