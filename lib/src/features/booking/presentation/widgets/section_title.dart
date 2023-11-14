import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.textStyle14Medium.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
