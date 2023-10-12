import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/profile/presentation/widgets/profile_image.dart';

import '../../../../core/helpers/helper.dart';
import 'info_container.dart';
import 'profile_icon_button.dart';
import 'profile_section_title.dart';
import 'user_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: FadeInUp(
        from: 20.h,
        child: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            bottom: 24.h,
            left: 44.w,
            right: 44.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ProfileIconButton(
                    icon: AppAssets.iconBackIos,
                    onTap: () => context.getBack(),
                  ),
                  const ProfileIconButton(
                    icon: AppAssets.iconNotification,
                    isNotification: true,
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.019),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Profile',
                  style: AppTextStyles.onBoardingHeadingTextStyle.copyWith(
                    fontSize: 30.sp,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.019),
              const ProfileImage(),
              SizedBox(height: SizeConfig.screenHeight! * 0.029),
              const ProfileSectionTitle(title: 'Personal Info'),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              InfoContainer(
                height: 170.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    UserInfo(
                      title: 'Your name',
                      info:
                          '${Helper.currentUser!.firstName} ${Helper.currentUser!.lastName}',
                    ),
                    UserInfo(
                      title: 'username',
                      info: '${Helper.currentUser!.username}',
                    ),
                    // TODO: Handle Occupataion
                    const UserInfo(
                      title: 'Occupation',
                      info: null,
                    ),
                    // TODO: Handle Nationality
                    const UserInfo(
                      title: 'Nationality',
                      info: null,
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.025),
              const ProfileSectionTitle(title: 'Contact Info'),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              InfoContainer(
                height: 85.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const UserInfo(
                      title: 'Phone number',
                      info: null,
                    ),
                    UserInfo(
                      title: 'Email',
                      info: Helper.currentUser!.email,
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.025),
              MyCustomButton(
                backgroundColor: AppColors.primaryColor,
                height: 50.h,
                width: SizeConfig.screenWidth,
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                onPressed: () {},
                hasPrefix:
                    false, // TODO: display a dialog inside it text fields and confirm edit button
                child: Center(
                  child: Text(
                    'Edit',
                    style: AppTextStyles.onBoardingHeadingTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
