import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCircleButton extends StatelessWidget {
  const ImageCircleButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final String icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 8.w,
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        fixedSize: Size(150.w, 130.h),
      ),
      child: Image.asset(
        icon,
        width: 180.w,
        height: 100.h,
      ),
    );
  }
}
