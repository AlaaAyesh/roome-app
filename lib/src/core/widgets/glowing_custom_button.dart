import 'package:flutter/material.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/widgets/main_button.dart';

class GlowingCustomButton extends StatelessWidget {
  const GlowingCustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return MainButton(
      onPressed: onPressed,
      boxShadow: <BoxShadow>[
        Helper.glowingShadow(),
      ],
      text: buttonText,
    );
  }
}
