import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:roome/src/config/router/app_router.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/service_locator.dart';
import 'package:roome/src/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:roome/src/features/home/presentation/cubits/hotels/hotels_cubit.dart';
import 'package:roome/src/features/home/presentation/cubits/near_me/near_me_cubit.dart';
import 'package:roome/src/features/home/presentation/cubits/recommended/recommended_cubit.dart';
import 'package:roome/src/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:roome/src/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class RoomeApp extends StatelessWidget {
  const RoomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(423, 887),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<RoomeCubit>()..getUserData(),
          ),
          BlocProvider(
            create: (context) => getIt.get<FavoriteCubit>()..getFavorites(),
          ),
          BlocProvider(
            create: (context) => getIt.get<HotelsCubit>()..getHotels(),
          ),
          BlocProvider(
            create: (context) => getIt.get<NearMeCubit>()..getNearMeHotels(),
          ),
          BlocProvider(
            create: (context) =>
                getIt.get<RecommendedCubit>()..getRecommendedHotels(),
          ),
          BlocProvider(
            create: (context) => getIt.get<NotificationsCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt.get<ProfileCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt.get<ThemesCubit>(),
          ),
        ],
        child: BlocBuilder<ThemesCubit, ThemeData>(
          builder: (context, themeState) {
            return MaterialApp(
              title: AppStrings.appTitle,
              debugShowCheckedModeBanner: false,
              theme: themeState,
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}
