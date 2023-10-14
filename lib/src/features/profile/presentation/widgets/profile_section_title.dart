import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class ProfileSectionTitle extends StatelessWidget {
  const ProfileSectionTitle({
    super.key,
    required this.title,
    this.animation,
    this.hasAnimation = true,
  });

  final Animation<Offset>? animation;
  final String title;
  final bool hasAnimation;

  @override
  Widget build(BuildContext context) {
    return hasAnimation
        ? AnimatedBuilder(
            animation: animation!,
            builder: (context, _) => SlideTransition(
              position: animation!,
              child: Text(
                title,
                style: AppTextStyles.appBarTextStyle.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
          )
        : Text(
            title,
            style: AppTextStyles.appBarTextStyle.copyWith(
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          );
  }
}
