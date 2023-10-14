import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class ProfileSectionTitle extends StatelessWidget {
  const ProfileSectionTitle({
    super.key,
    required this.title,
    required this.animation,
  });

  final Animation<Offset> animation;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) => SlideTransition(
        position: animation,
        child: Text(
          title,
          style: AppTextStyles.appBarTextStyle.copyWith(
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
