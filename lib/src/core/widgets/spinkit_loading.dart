import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/app_colors.dart';

class SpinkitLoading extends StatelessWidget {
  const SpinkitLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: AppColors.primaryColor,
    );
  }
}
