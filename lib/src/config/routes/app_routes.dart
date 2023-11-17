import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/core/models/using_hero_model.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/utils/service_locator.dart';
import 'package:roome/src/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:roome/src/features/auth/presentation/views/login_view.dart';
import 'package:roome/src/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:roome/src/features/auth/presentation/views/sign_up_view.dart';
import 'package:roome/src/features/booking/data/models/booked_hotel_info.dart';
import 'package:roome/src/features/booking/data/models/booking_info.dart';
import 'package:roome/src/features/booking/presentation/cubits/booking_one/booking_one_cubit.dart';
import 'package:roome/src/features/booking/presentation/cubits/payment/payment_cubit.dart';
import 'package:roome/src/features/booking/presentation/views/booking_one_view.dart';
import 'package:roome/src/features/booking/presentation/views/booking_two_view.dart';
import 'package:roome/src/features/booking/presentation/views/payment_view.dart';
import 'package:roome/src/features/booking/presentation/views/ticket_view.dart';
import 'package:roome/src/features/details/presentation/views/details_view.dart';
import 'package:roome/src/features/home/presentation/views/explore_see_all_view.dart';
import 'package:roome/src/features/home/presentation/views/location_map_view.dart';
import 'package:roome/src/features/home/presentation/views/near_me_see_all_view.dart';
import 'package:roome/src/features/home/presentation/views/search_location_view_.dart';
import 'package:roome/src/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:roome/src/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:roome/src/features/profile/presentation/views/edit_profile_view.dart';
import 'package:roome/src/features/roome/presentation/views/roome_view.dart';
import 'package:roome/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:roome/src/features/search/presentation/views/search_view.dart';
import 'package:roome/src/features/splash/presentation/views/splash_view.dart';

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

      case Routes.nearMeSeeAllViewRoute:
        return MaterialPageRoute(
          builder: (context) => const NearMeSeeAllView(),
        );

      case Routes.bookingOneViewRoute:
        final args = routeSettings.arguments as BookedHotelInfo;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator.get<BookingOneCubit>(),
            child: BookingOneView(bookedHotelInfo: args),
          ),
        );

      case Routes.bookingTwoViewRoute:
        final args = routeSettings.arguments as BookingInfo;
        return MaterialPageRoute(
          builder: (context) => BookingTwoView(bookingInfo: args),
        );

      case Routes.paymentViewRoute:
        final args = routeSettings.arguments as BookingInfo;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator.get<PaymentCubit>(),
            child: PaymentView(bookingInfo: args),
          ),
        );

      case Routes.ticketViewRoute:
        final args = routeSettings.arguments as BookingInfo;
        return MaterialPageRoute(
          builder: (context) => TicketView(bookingInfo: args),
        );

      case Routes.editProfileViewRoute:
        return MaterialPageRoute(builder: (context) => const EditProfileView());

      case Routes.locationMapViewRoute:
        return MaterialPageRoute(builder: (context) => const LocationMapView());

      case Routes.searchLocationViewRoute:
        return MaterialPageRoute(
          builder: (context) => const SearchLocationView(),
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
