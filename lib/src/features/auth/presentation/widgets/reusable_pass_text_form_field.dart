import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_text_form_field.dart';
import 'package:roome/src/core/widgets/visibility_icon_button.dart';

class ReusablePassTextField extends StatelessWidget {
  const ReusablePassTextField({
    super.key,
    required this.controller,
    required this.thisFocusNode,
    required this.hint,
    required this.prefixIcon,
    required this.visibilityIcon,
    required this.obscure,
    this.onSubmit,
    this.visibilityButtonOnPressed,
    this.validating,
  });

  final TextEditingController controller;
  final FocusNode thisFocusNode;

  final String hint;
  final IconData? prefixIcon;
  final IconData visibilityIcon;
  final bool obscure;

  final void Function(String)? onSubmit;
  final void Function()? visibilityButtonOnPressed;
  final String? Function(String?)? validating;

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
            size: 23,
          ),
          autofillHints: const <String>[AutofillHints.password],
          controller: controller,
          focusNode: thisFocusNode,
          textCapitalization: TextCapitalization.none,
          keyboardType: TextInputType.visiblePassword,
          suffixIconColor: AppColors.textFieldIconColor,
          obscure: obscure,
          suffixIcon: VisibilityIconButton(
            icon: visibilityIcon,
            onPressed: visibilityButtonOnPressed,
          ),
          validating: validating,
          onSubmit: onSubmit,
        );
      },
    );
  }
}
