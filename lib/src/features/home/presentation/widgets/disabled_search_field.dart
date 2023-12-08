import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/router/routes.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_text_form_field.dart';

class DisabledSearchField extends StatelessWidget {
  const DisabledSearchField({super.key, required this.state});

  final ThemeData state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateTo(routeName: Routes.searchViewRoute),
      child: CustomTextFormField(
        enabled: false,
        fillColor: state.brightness == Brightness.light
            ? AppColors.darkGrey.withOpacity(0.65)
            : Colors.white54,
        hintText: AppStrings.searchHint,
        hintStyle: AppTextStyles.textStyle14Medium.copyWith(
          color: AppColors.lightGrey.withOpacity(0.24),
        ),
        suffix: Icon(Icons.search, size: 22.w, color: Colors.black),
      ),
    );
  }
}
