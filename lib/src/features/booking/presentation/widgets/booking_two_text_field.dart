import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_text_form_field.dart';

class BookingTwoTextField extends StatelessWidget {
  const BookingTwoTextField({
    super.key,
    required this.controller,
    this.width = 140,
    required this.textCapitalization,
    required this.keyboardType,
    this.backgroundColor,
    this.border,
    this.hint,
    this.hintStyle,
    this.prefixIcon,
    this.validating,
    this.enabled,
  });

  final TextEditingController controller;
  final double? width;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final Color? backgroundColor;
  final String? hint;
  final TextStyle? hintStyle;
  final BoxBorder? border;
  final bool? enabled;
  final Widget? prefixIcon;
  final String? Function(String?)? validating;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      from: AppConstants.fadeInHorizontalValue,
      child: CustomTextFormField(
        enabled: enabled,
        hint: hint ?? '',
        controller: controller,
        hintStyle: hintStyle,
        textCapitalization: textCapitalization,
        keyboardType: keyboardType,
        backgroundColor:
            backgroundColor ?? AppColors.primaryColor.withOpacity(0.03),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        width: width,
        textFieldBorder: InputBorder.none,
        border: border ??
            Border.all(
              color: AppColors.darkGrey.withOpacity(0.63),
            ),
        cursorColor: Colors.black,
        style: AppTextStyles.textStyle15.copyWith(
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: prefixIcon,
        validating: validating,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorderColor: AppColors.primaryColor,
      ),
    );
  }
}
