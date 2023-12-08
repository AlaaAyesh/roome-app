import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstants {
  static double shimmerRadius = 4.0;
  static double get fadeInUpValue => 20;
  static double get fadeInHorizontalValue => 200;
  static const ScrollPhysics physics = BouncingScrollPhysics();
  static EdgeInsetsGeometry get authHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: 38.w);

  static double get horizontalViewPaddingValue => 21.w;
}
