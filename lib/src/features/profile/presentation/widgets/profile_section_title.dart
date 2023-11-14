import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class ProfileSectionTitle extends StatelessWidget {
  const ProfileSectionTitle({
    super.key,
    required this.title,
    this.animation,
    this.hasAnimation = true,
    required this.themeState,
  });

  final Animation<Offset>? animation;
  final String title;
  final bool hasAnimation;
  final ThemeData themeState;

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
                  color: themeState.brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
          )
        : Text(
            title,
            style: AppTextStyles.appBarTextStyle.copyWith(
              fontWeight: FontWeight.normal,
              color: themeState.brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
          );
  }
}
