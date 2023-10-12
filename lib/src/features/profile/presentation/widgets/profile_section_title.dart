import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class ProfileSectionTitle extends StatelessWidget {
  const ProfileSectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.appBarTextStyle.copyWith(
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    );
  }
}
