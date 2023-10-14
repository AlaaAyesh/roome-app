import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

import 'image_circle_button.dart';

class EditProfileImageBottomSheet {
  static void buildBottomSheet({
    required BuildContext context,
    required void Function()? onPressedGallery,
    required void Function()? onPressedCamera,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ProfileImageEditBottomSheet(
        context: context,
        onPressedCamera: onPressedCamera,
        onPressedGallery: onPressedGallery,
      ),
    );
  }
}

class ProfileImageEditBottomSheet extends StatelessWidget {
  const ProfileImageEditBottomSheet({
    Key? key,
    required this.context,
    this.onPressedGallery,
    this.onPressedCamera,
  }) : super(key: key);

  final BuildContext context;
  final VoidCallback? onPressedGallery;
  final VoidCallback? onPressedCamera;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50.0.r),
        ),
      ),
      enableDrag: true,
      onClosing: () => CustomNavigator.getBack(),
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            top: 10.w,
            left: 10.w,
            right: 10.w,
            bottom: 20.w,
          ),
          children: <Widget>[
            SizedBox(height: SizeConfig.screenHeight! * 0.008),
            Text(
              "Pick a profile picture",
              style: AppTextStyles.snackBarTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ImageCircleButton(
                  onPressed: onPressedGallery,
                  icon: AppAssets.addImage,
                ),
                ImageCircleButton(
                  onPressed: onPressedCamera,
                  icon: AppAssets.camera,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
