import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/helpers/helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class EditProfileTextField extends StatelessWidget {
  const EditProfileTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.title,
  });

  final TextEditingController controller;
  final String hint;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: AppTextStyles.textStyle12.copyWith(
            fontWeight: FontWeight.normal,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
        CustomTextFormField(
          height: 35.h,
          errorBorder: InputBorder.none,
          enabledBorder: Helper.buildUnderlineInputBorder(
            color: AppColors.grey.withOpacity(0.75),
          ),
          focusedBorder: Helper.buildUnderlineInputBorder(
            color: AppColors.grey.withOpacity(0.75),
          ),
          hint: hint,
          hintStyle: _buildTextStyle(),
          style: _buildTextStyle(),
          controller: controller,
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.name,
        ),
      ],
    );
  }

  TextStyle _buildTextStyle() {
    return AppTextStyles.hintStyle.copyWith(
      fontWeight: FontWeight.normal,
      color: Colors.black,
    );
  }
}
