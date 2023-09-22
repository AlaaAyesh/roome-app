import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:roome/src/config/routes/app_routes.dart';
import 'package:roome/src/config/themes/app_theme.dart';
import 'package:roome/src/core/utils/app_strings.dart';

class RoomeApp extends StatelessWidget {
  const RoomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: AppStrings.appTitle,
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
