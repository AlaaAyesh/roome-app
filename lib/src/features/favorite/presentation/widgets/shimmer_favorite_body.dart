import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/separator_widget.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFavoriteBody extends StatelessWidget {
  const ShimmerFavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Shimmer.fromColors(
          baseColor: state.brightness == Brightness.light
              ? AppColors.shimmerBaseColor
              : AppColors.darkShimmerBaseColor,
          highlightColor: state.brightness == Brightness.light
              ? AppColors.shimmerHighlightColor
              : AppColors.darkShimmerHighlightColor,
          enabled: true,
          child: SingleChildScrollView(
            physics: AppConstants.physics,
            child: Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                bottom: 16.h,
                right: 27.w,
                left: 14.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 15.h,
                    width: 110.w,
                    decoration: Helper.buildShimmerDecoration(state),
                  ),
                  SizedBox(height: 47.h),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                      height: 120.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.shimmerContainerColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        border: Border.all(
                          color: AppColors.borderColor,
                          width: 1.w,
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        SeparatorWidget(height: 33.h),
                    itemCount: 8,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
