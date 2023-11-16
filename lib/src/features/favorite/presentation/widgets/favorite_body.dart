import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          controlFavoriteStates(state, context),
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
                        padding: const EdgeInsets.only(
                          bottom: 16,
                          right: 27,
                          left: 14,
                        ),
                        // If SliverFillRemaining not working use SliverToBoxAdapter
                        sliver: SliverFillRemaining(
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
                                const SeparatorWidget(height: 33),
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
                      padding: const EdgeInsets.only(right: 27, left: 14),
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

  void controlFavoriteStates(FavoriteState state, BuildContext context) {
    if (state is RemoveFromFavSuccessState) {
      CustomSnackBar.show(
        backgroundColor: Colors.green,
        context: context,
        message: state.message,
        title: "Success",
        icon: Icons.check_circle,
      );
    }
  }
}
