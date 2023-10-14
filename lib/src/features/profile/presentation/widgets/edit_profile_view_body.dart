import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/features/profile/presentation/widgets/edit_profile_text_field.dart';
import 'package:roome/src/features/profile/presentation/widgets/info_container.dart';
import 'package:roome/src/features/profile/presentation/widgets/profile_icon_button.dart';
import 'package:roome/src/features/profile/presentation/widgets/profile_image.dart';

import '../../../../core/helpers/helper.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'profile_section_title.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody>
    with TickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                FadeInLeft(
                  from: _fadeInValue,
                  child: ProfileIconButton(
                    icon: AppAssets.iconBackIos,
                    onTap: () => context.getBack(),
                  ),
                ),
                SizedBox(width: SizeConfig.screenWidth! * 0.2),
                FadeInRight(
                  from: _fadeInValue,
                  child: Text(
                    'Edit Profile',
                    style: AppTextStyles.appBarTextStyle,
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.049),
            FadeInLeft(
              from: _fadeInValue,
              child: const ProfileImage(),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.029),
            FadeInRight(
              from: _fadeInValue,
              child: const ProfileSectionTitle(
                hasAnimation: false,
                title: 'Personal Info',
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.01),
            FadeInRight(
              from: _fadeInValue,
              child: InfoContainer(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    EditProfileTextField(
                      title: 'Name',
                      controller: _nameController,
                      hint:
                          '${Helper.currentUser!.firstName} ${Helper.currentUser!.lastName}',
                    ),
                    EditProfileTextField(
                      title: 'Username',
                      controller: _usernameController,
                      hint: Helper.currentUser!.username!,
                    ),
                    EditProfileTextField(
                      title: 'Occupation',
                      controller: _occupationController,
                      hint: 'UnKnow',
                    ),
                    EditProfileTextField(
                      title: 'Nationality',
                      controller: _nationalityController,
                      hint: 'UnKnow',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.025),
            FadeInRight(
              from: _fadeInValue,
              child: const ProfileSectionTitle(
                hasAnimation: false,
                title: 'Contact Info',
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.01),
            FadeInRight(
              from: _fadeInValue,
              child: InfoContainer(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    EditProfileTextField(
                      title: 'Phone number',
                      controller: _phoneNumberController,
                      hint: 'UnKnow',
                    ),
                    EditProfileTextField(
                      title: 'Email',
                      controller: _phoneNumberController,
                      hint: Helper.currentUser!.email!,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.044),
            FadeInLeft(
              from: _fadeInValue,
              child: MyCustomButton(
                height: 50.h,
                width: SizeConfig.screenWidth,
                backgroundColor: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                onPressed: () {},
                hasPrefix: false, // TODO: handle save edit
                child: Center(
                  child: Text(
                    'Save Edit',
                    style: AppTextStyles.onBoardingHeadingTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double get _fadeInValue => 200.w;

  void _disposeControllers() {
    _nameController.dispose();
    _usernameController.dispose();
    _occupationController.dispose();
    _nationalityController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
  }
}
