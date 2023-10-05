import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import 'package:roome/src/features/search/presentation/cubit/search_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
  });

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
    return CustomSearchTextField(
      height: 36.h,
      backgroundColor: AppColors.darkGrey.withOpacity(0.65),
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      searchTextFieldController: _searchTextFieldController,
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
      onChanged: (String hotelName) {
        BlocProvider.of<SearchCubit>(context)
            .searchHotels(hotelName: hotelName);
      },
    );
  }
}
