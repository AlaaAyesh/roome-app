import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(50.0),
          ),
        ),
        enableDrag: true,
        onClosing: () => context.getBack(),
        builder: (context) {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 20,
            ),
            children: <Widget>[
              const SizedBox(height: 4),
              Text(
                "Pick a profile picture",
                style: state.brightness == Brightness.light
                    ? AppTextStyles.snackBarTitle.copyWith(color: Colors.black)
                    : AppTextStyles.snackBarTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
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
