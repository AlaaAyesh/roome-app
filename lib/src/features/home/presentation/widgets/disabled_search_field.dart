import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class DisabledSearchField extends StatelessWidget {
  const DisabledSearchField({super.key, required this.state});

  final ThemeData state;

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchTextFieldController =
        TextEditingController();

    return GestureDetector(
      onTap: () => context.navigateTo(routeName: Routes.searchViewRoute),
      child: CustomSearchTextField(
        enabled: false,
        height: 36.h,
        width: 230.w,
        backgroundColor: state.brightness == Brightness.light
            ? AppColors.darkGrey.withOpacity(0.65)
            : Colors.white54,
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        searchTextFieldController: searchTextFieldController,
        hint: AppStrings.searchHint,
        hintStyle: AppTextStyles.textStyle14Medium.copyWith(
          color: AppColors.lightGrey.withOpacity(0.24),
        ),
        style: AppTextStyles.textStyle14Medium,
        suffixIcon: Icon(Icons.search, size: 22.w, color: Colors.black),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        cursorColor: Colors.black,
      ),
    );
  }
}
