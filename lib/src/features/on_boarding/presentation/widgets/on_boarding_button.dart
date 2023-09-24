import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.padding,
    required this.backgroundColor,
    required this.textStyle,
  });

  final String buttonText;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: MyCustomButton(
        onPressed: onPressed,
        hasPrefix: false,
        backgroundColor: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(50.r)),
        height: 46.h,
        width: 396.w,
        child: Center(
          child: Text(
            buttonText,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
