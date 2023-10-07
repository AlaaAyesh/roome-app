import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:roome/src/config/routes/app_routes.dart';
import 'package:roome/src/config/themes/app_theme.dart';
import 'package:roome/src/core/utils/app_strings.dart';

import 'src/core/utils/service_locator.dart';
import 'src/features/roome/presentation/cubit/hotels_cubit/hotels_cubit.dart';
import 'src/features/roome/presentation/cubit/near_me_cubit/near_me_cubit.dart';
import 'src/features/roome/presentation/cubit/recommended_cubit/recommended_cubit.dart';
import 'src/features/roome/presentation/cubit/roome/roome_cubit.dart';

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
        ],
        child: MaterialApp(
          title: AppStrings.appTitle,
          debugShowCheckedModeBanner: false,
          theme: lightTheme(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ),
      ),
    );
  }
}
