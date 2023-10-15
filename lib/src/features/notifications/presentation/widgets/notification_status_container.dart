import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationStatusContainer extends StatelessWidget {
  const NotificationStatusContainer({
    super.key,
    required this.circles,
    required this.color,
    required this.icon,
  });

  final String circles;
  final Color color;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SvgPicture.asset(circles),
        Container(
          height: 40.w,
          width: 40.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              height: 18.w,
              width: 18.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                color: Colors.white,
              ),
              child: Center(
                child: SvgPicture.asset(icon),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
