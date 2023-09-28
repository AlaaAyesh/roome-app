import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Home',
          style: AppTextStyles.snackBarTitle.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
