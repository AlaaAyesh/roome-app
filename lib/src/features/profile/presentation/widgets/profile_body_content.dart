import 'package:action_slider/action_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_navigator.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/helpers/helper.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../roome/presentation/cubit/roome_cubit.dart';
import 'info_container.dart';
import 'profile_icon_button.dart';
import 'profile_section_title.dart';
import 'user_info.dart';

class ProfileBodyContent extends StatefulWidget {
  const ProfileBodyContent({super.key});

  @override
  State<ProfileBodyContent> createState() => _ProfileBodyContentState();
}

class _ProfileBodyContentState extends State<ProfileBodyContent>
    with TickerProviderStateMixin {
  late AnimationController _leftAnimationController;
  late Animation<Offset> _leftSlideAnimation;

  late AnimationController _rightAnimationController;
  late Animation<Offset> _rightSlideAnimation;

  @override
  void initState() {
    _initLeftSlideAnimation();
    _initRightSlideAnimation();
    super.initState();
  }

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AnimatedBuilder(
                  animation: _leftAnimationController,
                  builder: (context, _) => SlideTransition(
                    position: _leftSlideAnimation,
                    child: ProfileIconButton(
                      icon: AppAssets.iconBackIos,
                      onTap: () {
                        BlocProvider.of<RoomeCubit>(context)
                            .changeBottomNavToHome(context);
                        BlocProvider.of<RoomeCubit>(context).getUserData();
                      },
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _rightSlideAnimation,
                  builder: (context, _) => SlideTransition(
                    position: _rightSlideAnimation,
                    child: const ProfileIconButton(
                      icon: AppAssets.moonIcon,
                      isNotBackIcon: true,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.019),
            AnimatedBuilder(
              animation: _leftAnimationController,
              builder: (context, _) => SlideTransition(
                position: _leftSlideAnimation,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Profile',
                    style: AppTextStyles.onBoardingHeadingTextStyle.copyWith(
                      fontSize: 30.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.019),
            AnimatedBuilder(
              animation: _leftSlideAnimation,
              builder: (context, _) => SlideTransition(
                position: _leftSlideAnimation,
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: Helper.currentUser!.profileImage ??
                        AppStrings.defaultImgUrl,
                    imageBuilder: (_, image) {
                      return CircleAvatar(
                        radius: 80.r,
                        backgroundColor:
                            AppColors.primaryColor.withOpacity(0.24),
                        child: CircleAvatar(
                          backgroundImage: image,
                          radius: 65.r,
                          backgroundColor: AppColors.primaryColor,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.029),
            ProfileSectionTitle(
              animation: _rightSlideAnimation,
              title: 'Personal Info',
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.01),
            AnimatedBuilder(
              animation: _rightSlideAnimation,
              builder: (context, _) => SlideTransition(
                position: _rightSlideAnimation,
                child: InfoContainer(
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.025),
            ProfileSectionTitle(
              animation: _rightSlideAnimation,
              title: 'Contact Info',
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.01),
            AnimatedBuilder(
              animation: _rightSlideAnimation,
              builder: (context, _) => SlideTransition(
                position: _rightSlideAnimation,
                child: InfoContainer(
                  height: 85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.025),
            AnimatedBuilder(
              animation: _leftSlideAnimation,
              builder: (context, _) => SlideTransition(
                position: _leftSlideAnimation,
                child: Center(
                  child: ActionSlider.standard(
                    backgroundColor: AppColors.primaryColor,
                    toggleColor: Colors.white,
                    backgroundBorderRadius:
                        BorderRadius.all(Radius.circular(100.r)),
                    height: 45.h,
                    width: SizeConfig.screenWidth! * 0.6,
                    slideAnimationCurve: Curves.fastLinearToSlowEaseIn,
                    action: (controller) async {
                      await _sliderButtonAction(controller, context);
                    },
                    rolling: true,
                    child: Text(
                      'Edit',
                      style: AppTextStyles.onBoardingHeadingTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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

  Future<void> _sliderButtonAction(
    ActionSliderController controller,
    BuildContext context,
  ) async {
    controller.loading();

    await Future.delayed(const Duration(milliseconds: 1500), () {
      controller.success();
    });

    await Future.delayed(const Duration(milliseconds: 200), () {
      controller.reset();
    });

    await Future.delayed(const Duration(milliseconds: 400), () {
      _forwardAnimationControllers();
    });

    await Future.delayed(const Duration(milliseconds: 300), () {
      _navigateToEditProfileView(context);
    });

    await Future.delayed(const Duration(milliseconds: 100), () {
      _resetAnimationControllers();
    });
  }

  void _resetAnimationControllers() {
    _leftAnimationController.reset();
    _rightAnimationController.reset();
  }

  void _navigateToEditProfileView(BuildContext context) {
    context.navigateTo(
      routeName: Routes.editProfileViewRoute,
    );
  }

  void _forwardAnimationControllers() {
    _leftAnimationController.forward();
    _rightAnimationController.forward();
  }

  void _disposeControllers() {
    _leftAnimationController.dispose();
    _rightAnimationController.dispose();
  }

  void _initLeftSlideAnimation() {
    _leftAnimationController = AnimationController(
      vsync: this,
      duration: _animationDuration(),
    );

    _leftSlideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(-200.w, 0),
    ).animate(
      CurvedAnimation(
        parent: _leftAnimationController,
        curve: _animationCurve,
      ),
    );
  }

  void _initRightSlideAnimation() {
    _rightAnimationController = AnimationController(
      vsync: this,
      duration: _animationDuration(),
    );

    _rightSlideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(200.w, 0),
    ).animate(
      CurvedAnimation(
        parent: _rightAnimationController,
        curve: _animationCurve,
      ),
    );
  }

  Duration _animationDuration() => const Duration(seconds: 3);
  Cubic get _animationCurve => Curves.easeIn;
}
