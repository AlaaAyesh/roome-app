import 'package:flutter/material.dart';
import 'package:roome/src/core/widgets/my_custom_button.dart';

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
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        height: 46,
        width: double.infinity,
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
