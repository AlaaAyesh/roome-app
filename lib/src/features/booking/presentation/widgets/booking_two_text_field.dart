import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class BookingTwoTextField extends StatefulWidget {
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
  });

  final TextEditingController controller;
  final double? width;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final Color? backgroundColor;
  final String? hint;
  final TextStyle? hintStyle;
  final BoxBorder? border;
  final Widget? prefixIcon;
  final String? Function(String?)? validating;

  @override
  State<BookingTwoTextField> createState() => _BookingTwoTextFieldState();
}

class _BookingTwoTextFieldState extends State<BookingTwoTextField> {
  bool isValidating = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hint: widget.hint ?? '',
      controller: widget.controller,
      hintStyle: widget.hintStyle,
      textCapitalization: widget.textCapitalization,
      keyboardType: widget.keyboardType,
      backgroundColor:
          widget.backgroundColor ?? AppColors.primaryColor.withOpacity(0.03),
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      height: isValidating ? 50.h : 40.h,
      width: widget.width?.w,
      textFieldBorder: InputBorder.none,
      border: widget.border ??
          Border.all(
            color: AppColors.darkGrey.withOpacity(0.63),
          ),
      cursorColor: Colors.black,
      style: AppTextStyles.textStyle15.copyWith(
        fontWeight: FontWeight.w500,
      ),
      prefixIcon: widget.prefixIcon,
      validating: (String? val) {
        setState(() {
          isValidating = true;
        });

        if (val!.isEmpty) {
          return "Can't be blank";
        }
        return null;
      },
      contentPadding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: isValidating ? 20.h : 8.h,
      ),
      errorBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorderColor: AppColors.primaryColor,
    );
  }
}
