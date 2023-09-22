import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:roome/src/core/utils/app_colors.dart';

ThemeData lightTheme() => ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
    );
