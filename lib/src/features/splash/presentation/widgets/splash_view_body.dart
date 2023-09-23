import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.imageSplashCover),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: SizeConfig.screenHeight! * 0.13),
          Image.asset(AppAssets.appIcon),
          Text(
            AppStrings.appTitle,
            style: AppTextStyle.splashTextStyle,
          ),
          CustomDivider(
            color: AppColors.primaryColor,
            height: 9.h,
            width: 203.w,
          ),
        ],
      ),
    );
  }
}
