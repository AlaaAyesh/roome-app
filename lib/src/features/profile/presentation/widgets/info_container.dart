import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.child,
    required this.height,
  });

  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.only(
        top: 20.h,
        bottom: 20.h,
        left: 20.w,
        right: 9.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        border: Border.all(
          color: HexColorHandler('D9D9D9').withOpacity(0.37),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0, 4.h),
            blurRadius: 4.w,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      child: child,
    );
  }
}
