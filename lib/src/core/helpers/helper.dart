import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/models/hotel.dart';
import 'package:roome/src/core/models/user_model.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class Helper {
  static int? uId;
  static UserModel? currentUser;

  static void getUserAndFavorites(BuildContext context) {
    BlocProvider.of<RoomeCubit>(context).getUserData();
    BlocProvider.of<FavoriteCubit>(context).getFavorites();
  }

  static UnderlineInputBorder buildUnderlineInputBorder({Color? color}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color ?? AppColors.primaryColor,
        width: 0.75,
      ),
    );
  }

  static BoxDecoration buildShimmerDecoration(ThemeData state) {
    return BoxDecoration(
      color: state.brightness == Brightness.light
          ? AppColors.shimmerContainerColor
          : AppColors.darkShimmerContainerColor,
      borderRadius: BorderRadius.all(
        Radius.circular(AppConstants.shimmerRadius),
      ),
    );
  }

  static BoxShadow glowingShadow() {
    return BoxShadow(
      offset: const Offset(0, 4.93),
      blurRadius: 18.49,
      color: AppColors.primaryColor.withOpacity(0.56),
    );
  }

  static int getLength(List<HotelImage> hotelImages) {
    return hotelImages.length >= 4 ? 3 : hotelImages.length;
  }
}
