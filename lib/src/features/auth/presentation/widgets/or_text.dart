import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class OrText extends StatelessWidget {
  const OrText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Or',
        style: AppTextStyles.textStyle15.copyWith(fontSize: 14),
      ),
    );
  }
}
