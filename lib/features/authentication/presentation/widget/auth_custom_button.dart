import 'package:flutter/material.dart';
import 'package:roome/core/global/app_assets.dart';
class AuthCustomButton extends StatelessWidget {
  const AuthCustomButton(
      {super.key, required this.name, required this.onPressed});
  final String name;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: kPrimaryNextColor,
          fixedSize: const Size(double.maxFinite, 55),
          textStyle: const TextStyle(color: Colors.white, fontSize: 15)),
      child: Text(name),
    );
  }
}
