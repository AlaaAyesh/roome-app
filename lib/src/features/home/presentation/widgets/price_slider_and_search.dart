import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/home/presentation/widgets/disabled_search_field.dart';
import 'package:roome/src/features/home/presentation/widgets/price_slider.dart';

class PriceSliderAndSearch extends StatelessWidget {
  const PriceSliderAndSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 0),
      padding: EdgeInsets.only(top: 11.h, left: 13.w, bottom: 11.h),
      margin: EdgeInsets.only(right: 26.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Price Range Per Night',
            style: AppTextStyles.textStyle14Medium.copyWith(
              fontSize: 13.sp,
            ),
          ),
          SizedBox(height: 50.h),
          const PriceSlider(),
          SizedBox(height: 5.h),
          BlocBuilder<ThemesCubit, ThemeData>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Row(
                  children: <Widget>[
                    Expanded(child: DisabledSearchField(state: state)),
                    SizedBox(width: 10.w),
                    Container(
                      height: 38.h,
                      width: 38.h,
                      decoration: BoxDecoration(
                        color: state.brightness == Brightness.light
                            ? Colors.white
                            : AppColors.darkGreyColor,
                        border: Border.all(
                          color: AppColors.grey.withOpacity(0.42),
                        ),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {}, // TODO: Filtering Logic
                          child: Icon(
                            Icons.filter_list,
                            size: 22.w,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
