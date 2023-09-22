import 'package:flutter/material.dart';
import 'package:roome/core/global/app_assets.dart';
class AuthIconButton extends StatelessWidget {
  const AuthIconButton({
    super.key,
    required this.onPressed,
    required this.iconName,
    required this.buttonName,
  });
  final void Function() onPressed;
  final String iconName;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: kPrimaryColor, width: 2),
                borderRadius: BorderRadius.circular(9.68),
              ),
              backgroundColor: Colors.white,
              fixedSize: const Size(58, 48)),
          child: Image(
              image: AssetImage(iconName),
              height: 29.3,
              width: 29.3,
              alignment: Alignment.center),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            buttonName,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        )
      ],
    );
  }
}
