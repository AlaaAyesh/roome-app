import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/custom_error_widget.dart';
import 'package:roome/src/core/widgets/custom_sliver_app_bar.dart';
import 'package:roome/src/core/widgets/custom_snack_bar.dart';
import 'package:roome/src/core/widgets/separator_widget.dart';
import 'package:roome/src/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:roome/src/features/favorite/presentation/widgets/favorite_card.dart';
import 'package:roome/src/features/favorite/presentation/widgets/shimmer_favorite_body.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (BuildContext context, FavoriteState state) =>
          _controlFavoriteStates(state, context),
      builder: (context, state) {
        FavoriteCubit cubit = BlocProvider.of<FavoriteCubit>(context);

        if (state is GetFavoritesLoadingState) {
          return const ShimmerFavoriteBody();
        } else if (state is GetFavoritesSuccessState) {
          return state.favorites.isNotEmpty
              ? FadeInUp(
                  from: AppConstants.fadeInUpValue,
                  child: CustomScrollView(
                    physics: AppConstants.physics,
                    slivers: [
                      CustomSliverAppBar(
                        titleText: 'Favorite',
                        arrowBackOnTap: () {
                          BlocProvider.of<RoomeCubit>(context)
                              .changeBottomNavToHome(context);
                          BlocProvider.of<RoomeCubit>(context).getUserData();
                        },
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(
                          bottom: 16.h,
                          right: 27.w,
                          left: 14.w,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.favorites.length,
                            itemBuilder: (context, index) => FavoriteCard(
                              cubit: cubit,
                              hotel: state.favorites[index],
                            ),
                            separatorBuilder: (context, index) =>
                                SeparatorWidget(height: 33.h),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : FadeInDown(
                  from: AppConstants.fadeInUpValue,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 27.w, left: 14.w),
                      child: SvgPicture.asset(
                        AppAssets.imageNoFavorite,
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                  ),
                );
        } else if (state is GetFavoritesErrorState) {
          return CustomErrorWidget(
            error: state.error,
            onPressed: () => cubit.getFavorites(),
          );
        } else {
          return const ShimmerFavoriteBody();
        }
      },
    );
  }

  void _controlFavoriteStates(FavoriteState state, BuildContext context) {
    if (state is RemoveFromFavSuccessState) {
      CustomSnackBar.show(
        context: context,
        message: state.message,
        state: CustomSnackBarState.success,
      );
    }
  }
}
