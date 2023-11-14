import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/profile/presentation/widgets/image_circle_button.dart';

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
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) => BottomSheet(
        backgroundColor:
            state.brightness == Brightness.light ? Colors.white : Colors.black,
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
                style: state.brightness == Brightness.light
                    ? AppTextStyles.snackBarTitle.copyWith(color: Colors.black)
                    : AppTextStyles.snackBarTitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ImageCircleButton(
                    onPressed: onPressedGallery,
                    icon: AppAssets.imageAddImage,
                  ),
                  ImageCircleButton(
                    onPressed: onPressedCamera,
                    icon: AppAssets.imageCamera,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
