import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home',
          style: AppTextStyle.onBoardingSubHeadingTextStyle,
        ),
      ),
    );
  }
}
