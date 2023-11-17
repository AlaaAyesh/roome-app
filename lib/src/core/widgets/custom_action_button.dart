import 'package:flutter/material.dart';
import 'package:roome/src/core/widgets/my_custom_button.dart';

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
        height: 50,
        width: double.infinity,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
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
