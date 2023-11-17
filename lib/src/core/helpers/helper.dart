import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/models/hotel.dart';
import 'package:roome/src/core/models/user_model.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/custom_snack_bar.dart';
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

  static void validatingPasswordField({
    required BuildContext context,
    String? value,
  }) {
    if (value!.isEmpty) {
      CustomSnackBar.show(
        context: context,
        title: "Something went wrong",
        message: "Password can't be blank!",
      );
    } else if (value.length < 8) {
      CustomSnackBar.show(
        context: context,
        title: "Something went wrong",
        message: "Too short password!",
      );
    }
  }

  static void validatingEmailField({
    required BuildContext context,
    String? value,
  }) {
    if (value!.isEmpty) {
      CustomSnackBar.show(
        context: context,
        title: "Something went wrong",
        message: "Email can't be blank!",
      );
    } else if (!value.contains('@')) {
      CustomSnackBar.show(
        context: context,
        title: "Something went wrong",
        message: "Incorrect Email!",
      );
    }
  }

  static void validatingNameField({
    required BuildContext context,
    required textName,
    String? value,
  }) {
    if (value!.isEmpty) {
      CustomSnackBar.show(
        context: context,
        title: "Something went wrong",
        message: "$textName can't be blank!",
      );
    }
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

  static void keyboardUnfocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
