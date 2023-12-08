import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_text_form_field.dart';
import 'package:roome/src/features/search/presentation/cubit/search_cubit.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _searchTextFieldController =
      TextEditingController();

  @override
  void dispose() {
    _searchTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      autofocus: true,
      fillColor: AppColors.primaryColor.withOpacity(0.03),
      controller: _searchTextFieldController,
      hintText: AppStrings.searchHint,
      hintStyle: AppTextStyles.textStyle14Medium.copyWith(
        color: AppColors.lightGrey.withOpacity(0.24),
      ),
      suffix: Icon(Icons.search, size: 22.h, color: AppColors.primaryColor),
      enabledBorder: Helper.buildOutlineInputBorder(),
      focusedBorder: Helper.buildOutlineInputBorder(),
      onChanged: (String hotelName) {
        BlocProvider.of<SearchCubit>(context)
            .searchHotels(hotelName: hotelName);
      },
    );
  }
}
