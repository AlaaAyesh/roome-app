import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/app_colors.dart';

class SpinkitFading extends StatelessWidget {
  const SpinkitFading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: AppColors.primaryColor,
    );
  }
}
