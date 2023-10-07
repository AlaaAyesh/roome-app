import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class DetailsSectionTitle extends StatelessWidget {
  const DetailsSectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.textStyle15.copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
