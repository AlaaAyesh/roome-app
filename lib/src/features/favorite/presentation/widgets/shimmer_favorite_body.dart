import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              padding: const EdgeInsets.only(
                top: 40,
                bottom: 16,
                right: 27,
                left: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 15,
                    width: 110,
                    decoration: Helper.buildShimmerDecoration(state),
                  ),
                  const SizedBox(height: 47),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.shimmerContainerColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: AppColors.borderColor,
                          width: 1,
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
