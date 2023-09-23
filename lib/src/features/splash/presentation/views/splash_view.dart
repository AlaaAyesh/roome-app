import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/routes/app_routes.dart';
import 'package:roome/src/features/splash/presentation/widgets/splash_view_body.dart';

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

  void _goToNext() =>
      Navigator.pushReplacementNamed(context, Routes.onBoardingViewRoute);

  void setSystemUIOverlayStyle() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      CustomHelper.setTheSystemUIOverlayStyle(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
