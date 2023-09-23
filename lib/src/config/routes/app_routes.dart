import 'package:flutter/material.dart';
import 'package:roome/src/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:roome/src/features/splash/presentation/views/splash_view.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoardingViewRoute = '/onBoardingView';
  static const String signInViewRoute = '/signInView';
  static const String signUpViewRoute = '/signUpView';
}

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case Routes.onBoardingViewRoute:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());

      default:
        return unFoundRoute();
    }
  }

  static Route<dynamic> unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text("Un Found Route"),
        ),
      ),
    );
  }
}
