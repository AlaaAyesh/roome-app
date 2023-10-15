import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

import '../helpers/helper.dart';
import '../utils/app_colors.dart';

class ReusableTextFormField extends StatelessWidget {
  const ReusableTextFormField({
    super.key,
    required this.controller,
    required this.hint,
    required this.prefixIcon,
    required this.keyboardType,
    required this.textCapitalization,
    this.thisFocusNode,
    this.validating,
    this.onEditingComplete,
    this.onSubmit,
  });

  final TextEditingController controller;
  final FocusNode? thisFocusNode;
  final String hint;
  final IconData? prefixIcon;
  final String? Function(String?)? validating;
  final VoidCallback? onEditingComplete;
  final void Function(String)? onSubmit;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return CustomTextFormField(
          cursorColor: state.brightness == Brightness.light
              ? Colors.black
              : Colors.white,
          hint: hint,
          hintStyle: AppTextStyles.hintStyle,
          style: AppTextStyles.hintStyle.copyWith(
            color: state.brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          enabledBorder: Helper.buildUnderlineInputBorder(),
          focusedBorder: Helper.buildUnderlineInputBorder(),
          prefixIcon: Icon(
            prefixIcon,
            color: state.brightness == Brightness.light
                ? AppColors.textFieldIconColor
                : AppColors.white60,
            size: 23.w,
          ),
          controller: controller,
          focusNode: thisFocusNode,
          textCapitalization: textCapitalization,
          keyboardType: keyboardType,
          validating: validating,
          onEditingComplete: onEditingComplete,
          onSubmit: onSubmit,
        );
      },
    );
  }
}
