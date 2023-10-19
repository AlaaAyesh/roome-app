import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../config/routes/routes.dart';
import '/src/core/helpers/cache_helper.dart';
import '/src/core/helpers/helper.dart';
import '/src/core/utils/app_navigator.dart';
import '/src/features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer _timer;

  @override
  void initState() {
    _startDelay();
    setSystemUIOverlayStyle();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startDelay() {
    _timer = Timer(const Duration(milliseconds: 1500), () => _goToNext());
  }

  void _goToNext() {
    bool? onBoarding = CacheHelper.getBoolData(key: 'onBoarding');

    if (onBoarding != null) {
      if (Helper.uId != null) {
        context.navigateAndRemoveUntil(newRoute: Routes.roomViewRoute);
      } else {
        context.navigateAndRemoveUntil(newRoute: Routes.loginViewRoute);
      }
    } else {
      context.navigateAndRemoveUntil(newRoute: Routes.onBoardingViewRoute);
    }
  }

  void setSystemUIOverlayStyle() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      CustomHelper.setTheSystemUIOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
