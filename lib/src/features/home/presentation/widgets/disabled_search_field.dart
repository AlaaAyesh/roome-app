import 'package:flutter/material.dart';
import 'package:roome/src/config/routes/routes.dart';
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
    final TextEditingController searchTextFieldController =
        TextEditingController();

    return GestureDetector(
      onTap: () => context.navigateTo(routeName: Routes.searchViewRoute),
      child: CustomTextFormField(
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.none,
        enabled: false,
        height: 36,
        width: 230,
        backgroundColor: state.brightness == Brightness.light
            ? AppColors.darkGrey.withOpacity(0.65)
            : Colors.white54,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        controller: searchTextFieldController,
        hint: AppStrings.searchHint,
        hintStyle: AppTextStyles.textStyle14Medium.copyWith(
          color: AppColors.lightGrey.withOpacity(0.24),
        ),
        style: AppTextStyles.textStyle14Medium,
        suffixIcon: const Icon(Icons.search, size: 22, color: Colors.black),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        cursorColor: Colors.black,
      ),
    );
  }
}
