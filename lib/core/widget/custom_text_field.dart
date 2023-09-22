import 'package:flutter/material.dart';

import '../global/app_assets.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    this.hintText,
    this.preIcon,
    this.onPressed,
    this.sufIconVisible,
    this.sufIconInVisible, required this.obscureText, this.keyboardType, this.onChanged,
  });
  final String? hintText;
  final IconData? preIcon;
  final IconData? sufIconVisible;
  final IconData? sufIconInVisible;
  final void Function()? onPressed;
  late  bool obscureText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.preIcon,
        ),
        hintText: widget.hintText,
        labelStyle: const TextStyle(color: kPrimaryColor),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            widget.obscureText ? widget.sufIconVisible : widget.sufIconInVisible,
          ),
          onPressed: () {
            setState(
                  () {
                widget.obscureText = !widget.obscureText;
              },
            );
          },
        ),
        alignLabelWithHint: false,
      ),
      obscureText: widget.obscureText,
      textInputAction: TextInputAction.done,
    );
  }
}
