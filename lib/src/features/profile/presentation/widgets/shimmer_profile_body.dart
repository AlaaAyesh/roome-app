import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/features/profile/presentation/widgets/profile_shimmer_section_title.dart';
import 'package:roome/src/features/profile/presentation/widgets/shimmer_profile_app_bar_icon.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/core/widgets/custom_sliver_app_bar.dart';

class ShimmerProfileBody extends StatelessWidget {
  const ShimmerProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(builder: (context, state) {
      return FadeInUp(
        from: AppConstants.fadeInUpValue,
        child: Shimmer.fromColors(
          baseColor: state.brightness == Brightness.light
              ? AppColors.shimmerBaseColor
              : AppColors.darkShimmerBaseColor,
          highlightColor: state.brightness == Brightness.light
              ? AppColors.shimmerHighlightColor
              : AppColors.darkShimmerHighlightColor,
          enabled: true,
          child: CustomScrollView(
            physics: AppConstants.physics,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 44.w),
                sliver: CustomSliverAppBar(
                  leading: ShimmerProfileAppBarIcon(state: state),
                  actions: <Widget>[ShimmerProfileAppBarIcon(state: state)],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 44.w),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfileShimmerSectionTitle(state: state),
                      SizedBox(height: 19.h),
                      Container(
                        height: 160.h,
                        width: 160.w,
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                          color: state.brightness == Brightness.light
                              ? AppColors.shimmerContainerColor
                              : AppColors.darkShimmerContainerColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(height: 29.h),
                      ProfileShimmerSectionTitle(state: state),
                      SizedBox(height: 10.h),
                      Container(
                        height: 170,
                        width: double.infinity,
                        decoration: Helper.buildShimmerDecoration(state),
                      ),
                      SizedBox(height: 29.h),
                      ProfileShimmerSectionTitle(state: state),
                      SizedBox(height: 10.h),
                      Container(
                        height: 85.h,
                        width: double.infinity,
                        decoration: Helper.buildShimmerDecoration(state),
                      ),
                      SizedBox(height: 25.h),
                      Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: Helper.buildShimmerDecoration(state),
                      ),
                      const BottomSpacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
