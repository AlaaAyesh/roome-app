import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/utils/service_locator.dart';
import 'package:roome/src/features/auth/sign_in/presentation/cubit/login_cubit.dart';
import 'package:roome/src/features/auth/sign_in/presentation/views/login_view.dart';
import 'package:roome/src/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:roome/src/features/auth/sign_up/presentation/views/sign_up_view.dart';
import 'package:roome/src/features/details/presentation/views/details_view.dart';

import 'package:roome/src/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:roome/src/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:roome/src/core/models/using_hero_model.dart';
import 'package:roome/src/features/roome/presentation/views/explore_see_all_view.dart';
import 'package:roome/src/features/roome/presentation/views/roome_view.dart';
import 'package:roome/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:roome/src/features/search/presentation/views/search_view.dart';
import 'package:roome/src/features/splash/presentation/views/splash_view.dart';

import 'routes.dart';

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

      case Routes.signUpViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator.get<SignUpCubit>(),
            child: const SignUpView(),
          ),
        );

      case Routes.roomViewRoute:
        return MaterialPageRoute(
          builder: (context) => const RoomeView(),
        );

      case Routes.searchViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator.get<SearchCubit>(),
            child: const SearchView(),
          ),
        );

      case Routes.detailsViewRoute:
        final args = routeSettings.arguments as UsingHeroModel;
        return MaterialPageRoute(
          builder: (context) => DetailsView(
            hotel: args.hotel,
            usingHero: args.usingHero,
          ),
        );

      case Routes.exploreSeeAllViewRoute:
        return MaterialPageRoute(
          builder: (context) => const ExploreSeeAllView(),
        );

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
            style: AppTextStyles.splashTextStyle,
          ),
        ),
      ),
    );
  }
}
