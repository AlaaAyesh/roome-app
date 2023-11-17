import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
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
                padding: const EdgeInsets.symmetric(horizontal: 44),
                sliver: CustomSliverAppBar(
                  leading: ShimmerProfileAppBarIcon(state: state),
                  actions: <Widget>[ShimmerProfileAppBarIcon(state: state)],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfileShimmerSectionTitle(state: state),
                      const SizedBox(height: 19),
                      Container(
                        height: 160,
                        width: 160,
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                          color: state.brightness == Brightness.light
                              ? AppColors.shimmerContainerColor
                              : AppColors.darkShimmerContainerColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(height: 29),
                      ProfileShimmerSectionTitle(state: state),
                      const SizedBox(height: 10),
                      Container(
                        height: 170,
                        width: double.infinity,
                        decoration: Helper.buildShimmerDecoration(state),
                      ),
                      const SizedBox(height: 29),
                      ProfileShimmerSectionTitle(state: state),
                      const SizedBox(height: 10),
                      Container(
                        height: 85,
                        width: double.infinity,
                        decoration: Helper.buildShimmerDecoration(state),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        height: 50,
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

class ProfileShimmerSectionTitle extends StatelessWidget {
  const ProfileShimmerSectionTitle({
    super.key,
    required this.state,
  });

  final ThemeData state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 100,
      decoration: Helper.buildShimmerDecoration(state),
    );
  }
}

class ShimmerProfileAppBarIcon extends StatelessWidget {
  const ShimmerProfileAppBarIcon({
    super.key,
    required this.state,
  });

  final ThemeData state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: Helper.buildShimmerDecoration(state),
    );
  }
}
