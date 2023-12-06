import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      fillColor: AppColors.darkGrey.withOpacity(0.65),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      controller: _searchTextFieldController,
      hintText: AppStrings.searchHint,
      hintStyle: AppTextStyles.textStyle14Medium.copyWith(
        color: AppColors.lightGrey.withOpacity(0.24),
      ),
      suffixIcon: const Icon(Icons.search, size: 22, color: Colors.black),
      enabledBorder: _buildOutlinedBorder(),
      focusedBorder: _buildOutlinedBorder(),
      onChanged: (String hotelName) {
        BlocProvider.of<SearchCubit>(context)
            .searchHotels(hotelName: hotelName);
      },
    );
  }

  OutlineInputBorder _buildOutlinedBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)));
  }
}
