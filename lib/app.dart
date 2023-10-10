import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:roome/src/config/routes/app_routes.dart';
import 'package:roome/src/config/themes/app_theme.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/features/roome/presentation/cubits/favorite/favorite_cubit.dart';

import 'src/core/utils/service_locator.dart';

import 'src/features/roome/presentation/cubits/hotels/hotels_cubit.dart';
import 'src/features/roome/presentation/cubits/near_me/near_me_cubit.dart';
import 'src/features/roome/presentation/cubits/recommended/recommended_cubit.dart';
import 'src/features/roome/presentation/cubits/roome/roome_cubit.dart';

class RoomeApp extends StatelessWidget {
  const RoomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                serviceLocator.get<RoomeCubit>()..getUserData(),
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
        ],
        child: MaterialApp(
          title: AppStrings.appTitle,
          debugShowCheckedModeBanner: false,
          theme: lightTheme(context),
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ),
      ),
    );
  }
}
