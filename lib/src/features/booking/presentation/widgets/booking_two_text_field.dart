import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '/src/core/utils/app_constants.dart';

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
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        width: width?.w,
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
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorderColor: AppColors.primaryColor,
      ),
    );
  }
}
