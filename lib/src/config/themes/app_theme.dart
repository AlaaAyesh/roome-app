import 'package:flutter/material.dart';

import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_strings.dart';

ThemeData lightTheme(context) => ThemeData(
      primaryColor: AppColors.primaryColor,
      // For Dialogs
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor,
        onPrimary: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      fontFamily: AppStrings.fontFamily,
    );
