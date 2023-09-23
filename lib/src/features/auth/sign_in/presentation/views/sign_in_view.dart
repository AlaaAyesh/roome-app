import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Sign In',
          style: AppTextStyle.onBoardingSubHeadingTextStyle,
        ),
      ),
    );
  }
}
