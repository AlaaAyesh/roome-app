import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/profile/presentation/widgets/edit_profile_form.dart';
import 'package:roome/src/features/profile/presentation/widgets/profile_icon_button.dart';
import 'package:roome/src/features/profile/presentation/widgets/profile_image.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
          top: 30.h,
          bottom: 24.h,
          left: 44.w,
          right: 44.w,
        ),
        child: BlocBuilder<ThemesCubit, ThemeData>(builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  FadeInLeft(
                    from: AppConstants.fadeInHorizontalValue,
                    child: ProfileIconButton(
                      icon: AppAssets.iconBackIos,
                      onTap: () => context.getBack(),
                    ),
                  ),
                  SizedBox(width: SizeConfig.screenWidth! * 0.2),
                  FadeInRight(
                    from: AppConstants.fadeInHorizontalValue,
                    child: Text(
                      'Edit Profile',
                      style: state.brightness == Brightness.light
                          ? AppTextStyles.appBarTextStyle
                          : AppTextStyles.appBarTextStyle
                              .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.049),
              FadeInLeft(
                from: AppConstants.fadeInHorizontalValue,
                child: const ProfileImage(),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.029),
              const EditProfileForm(),
            ],
          );
        }),
      ),
    );
  }
}
