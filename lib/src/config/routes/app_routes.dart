import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/utils/service_locator.dart';
import 'package:roome/src/features/auth/sign_in/presentation/cubit/login_cubit.dart';
import 'package:roome/src/features/auth/sign_in/presentation/views/login_view.dart';
import 'package:roome/src/features/home/presentation/views/home_view.dart';
import 'package:roome/src/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:roome/src/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:roome/src/features/splash/presentation/views/splash_view.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoardingViewRoute = '/onBoardingView';
  static const String loginViewRoute = '/loginView';
  static const String signUpViewRoute = '/signUpView';
  static const String homeViewRoute = '/homeView';
}

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case Routes.onBoardingViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator.get<OnBoardingCubit>(),
            child: const OnBoardingView(),
          ),
        );

      case Routes.loginViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator.get<LoginCubit>(),
            child: const LoginView(),
          ),
        );

      case Routes.homeViewRoute:
        return MaterialPageRoute(builder: (context) => const HomeView());

      default:
        return unFoundRoute();
    }
  }

  static Route<dynamic> unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(
            "Un Found Route",
            style: AppTextStyle.splashTextStyle,
          ),
        ),
      ),
    );
  }
}
