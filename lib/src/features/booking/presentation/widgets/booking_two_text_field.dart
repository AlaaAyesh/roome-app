import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/custom_text_form_field.dart';

class BookingTwoTextField extends StatelessWidget {
  const BookingTwoTextField({
    super.key,
    required this.controller,
    required this.textCapitalization,
    required this.keyboardType,
    this.hint,
    this.prefixIcon,
    this.validating,
    this.enabled,
  });

  final TextEditingController controller;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final String? hint;
  final bool? enabled;
  final Widget? prefixIcon;
  final String? Function(String?)? validating;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      from: AppConstants.fadeInHorizontalValue,
      child: CustomTextFormField(
        enabled: enabled,
        hintText: hint ?? '',
        controller: controller,
        textCapitalization: textCapitalization,
        keyboardType: keyboardType,
        prefix: prefixIcon,
        validating: validating,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
    );
  }
}
