import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_text_form_field.dart';

class EditProfileTextField extends StatelessWidget {
  const EditProfileTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.title,
    required this.keyboardType,
    required this.textCapitalization,
    this.validating,
    this.suffixIcon,
    this.obscure,
  });

  final TextEditingController controller;
  final String hint;
  final String title;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validating;
  final Widget? suffixIcon;
  final bool? obscure;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: AppTextStyles.textStyle12.copyWith(
                fontWeight: FontWeight.normal,
                color: state.brightness == Brightness.light
                    ? Colors.black.withOpacity(0.8)
                    : AppColors.white38,
              ),
            ),
            CustomTextFormField(
              errorBorder: InputBorder.none,
              enabledBorder: Helper.buildUnderlineInputBorder(
                color: AppColors.grey.withOpacity(0.75),
              ),
              focusedBorder: Helper.buildUnderlineInputBorder(
                color: AppColors.grey.withOpacity(0.75),
              ),
              hint: hint,
              cursorColor: state.brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              hintStyle: AppTextStyles.hintStyle,
              style: _buildTextStyle(state),
              controller: controller,
              textCapitalization: textCapitalization,
              keyboardType: keyboardType,
              validating: validating,
              suffixIcon: suffixIcon,
              obscure: obscure,
            ),
          ],
        );
      },
    );
  }

  TextStyle _buildTextStyle(ThemeData themeState) {
    return AppTextStyles.hintStyle.copyWith(
      fontWeight: FontWeight.normal,
      color: themeState.brightness == Brightness.light
          ? Colors.black
          : Colors.white,
    );
  }
}
