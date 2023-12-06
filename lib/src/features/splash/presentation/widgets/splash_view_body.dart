import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/splash/presentation/widgets/faded_widget.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FadedWidget(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imageSplashCover),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Spacer(),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40.r)),
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
      ),
    );
  }
}
