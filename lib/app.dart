import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:roome/src/config/routes/app_routes.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/utils/service_locator.dart';
import 'package:roome/src/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:roome/src/features/home/presentation/cubits/hotels/hotels_cubit.dart';
import 'package:roome/src/features/home/presentation/cubits/near_me/near_me_cubit.dart';
import 'package:roome/src/features/home/presentation/cubits/recommended/recommended_cubit.dart';
import 'package:roome/src/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class RoomeApp extends StatelessWidget {
  const RoomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator.get<RoomeCubit>()..getUserData(),
        ),
        BlocProvider(
          create: (context) => serviceLocator.get<HotelsCubit>()..getHotels(),
        ),
        BlocProvider(
          create: (context) =>
              serviceLocator.get<NearMeCubit>()..getNearMeHotels(),
        ),
        BlocProvider(
          create: (context) =>
              serviceLocator.get<RecommendedCubit>()..getRecommendedHotels(),
        ),
        BlocProvider(
          create: (context) =>
              serviceLocator.get<FavoriteCubit>()..getFavorites(),
        ),
        BlocProvider(create: (context) => serviceLocator.get<ThemesCubit>()),
        BlocProvider(
          create: (context) => serviceLocator.get<NotificationsCubit>(),
        ),
      ],
      child: BlocBuilder<ThemesCubit, ThemeData>(
        builder: (context, themeState) {
          return MaterialApp(
            title: AppStrings.appTitle,
            debugShowCheckedModeBanner: false,
            theme: themeState,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          );
        },
      ),
    );
  }
}
