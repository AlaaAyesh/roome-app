import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/custom_app_bar.dart';
import 'package:roome/src/core/widgets/custom_error_widget.dart';
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
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: FadeInUp(
                    from: AppConstants.fadeInUpValue,
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
                          CustomAppBar(
                            spaceBetween: 40,
                            title: 'Favorite',
                            arrowOnTap: () {
                              BlocProvider.of<RoomeCubit>(context)
                                  .changeBottomNavToHome(context);
                              BlocProvider.of<RoomeCubit>(context)
                                  .getUserData();
                            },
                          ),
                          SizedBox(height: SizeConfig.screenHeight! * 0.047),
                          ListView.separated(
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
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : FadeInDown(
                  from: AppConstants.fadeInUpValue,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 40.h,
                        bottom: 16.h,
                        right: 27.w,
                        left: 14.w,
                      ),
                      child: SvgPicture.asset(
                        AppAssets.imageNoFavorite,
                        fit: BoxFit.contain,
                        height: SizeConfig.screenHeight! * 0.5,
                        width: SizeConfig.screenWidth,
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
