import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.textStyle,
    required this.backgroundColor,
    this.boxShadow,
  });

  final String buttonText;
  final VoidCallback onPressed;
  final TextStyle textStyle;
  final Color backgroundColor;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: MyCustomButton(
        height: 40.h,
        width: 200.w,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
        backgroundColor: backgroundColor,
        onPressed: onPressed,
        hasPrefix: false,
        boxShadow: boxShadow,
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
