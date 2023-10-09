import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/widgets/custom_snack_bar.dart';

import '../models/hotel.dart';
import '../models/user_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';

class Helper {
  static int? uId;
  static UserModel? currentUser;

  static UnderlineInputBorder buildUnderlineInputBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primaryColor,
        width: 0.75.w,
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

  static BoxDecoration buildShimmerDecoration() {
    return BoxDecoration(
      color: AppColors.shimmerContainerColor,
      borderRadius: BorderRadius.all(
        Radius.circular(AppConstants.shimmerRadius.r),
      ),
    );
  }

  static BoxShadow glowingShadow() {
    return BoxShadow(
      offset: Offset(0, 4.93.w),
      blurRadius: 18.49.w,
      color: AppColors.primaryColor.withOpacity(0.56),
    );
  }

  static int getLength(List<HotelImage> hotelImages) {
    return hotelImages.length >= 4 ? 3 : hotelImages.length;
  }
}
