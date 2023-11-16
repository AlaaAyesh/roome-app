import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.imageSplashCover),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          const Spacer(),
          Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              child: Image.asset(AppAssets.appIcon),
            ),
          ),
          Text(
            AppStrings.appTitle,
            style: AppTextStyles.splashTextStyle,
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}
