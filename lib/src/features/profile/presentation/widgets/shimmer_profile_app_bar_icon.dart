import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/helpers/helper.dart';

class ShimmerProfileAppBarIcon extends StatelessWidget {
  const ShimmerProfileAppBarIcon({
    super.key,
    required this.state,
  });

  final ThemeData state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      width: 24.h,
      decoration: Helper.buildShimmerDecoration(state),
    );
  }
}
