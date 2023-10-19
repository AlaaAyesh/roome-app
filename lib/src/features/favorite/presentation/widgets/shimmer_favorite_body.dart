import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helpers/helper.dart';
import '../../../../core/utils/app_colors.dart';
import '/src/config/themes/cubit/themes_cubit.dart';
import '/src/core/widgets/separator_widget.dart';

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
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                top: 40.h,
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
                  SizedBox(height: SizeConfig.screenHeight! * 0.047),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                      height: SizeConfig.screenHeight! * 0.15,
                      width: SizeConfig.screenWidth! * 0.9,
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
                        const SeparatorWidget(height: 33),
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
