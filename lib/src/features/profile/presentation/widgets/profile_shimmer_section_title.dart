import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/helpers/helper.dart';

class ProfileShimmerSectionTitle extends StatelessWidget {
  const ProfileShimmerSectionTitle({
    super.key,
    required this.state,
  });

  final ThemeData state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      width: 100.w,
      decoration: Helper.buildShimmerDecoration(state),
    );
  }
}
