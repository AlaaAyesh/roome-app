import 'package:action_slider/action_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/router/routes.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/features/profile/presentation/widgets/contact_info.dart';
import 'package:roome/src/features/profile/presentation/widgets/custom_profile_app_bar.dart';
import 'package:roome/src/features/profile/presentation/widgets/personal_info.dart';
import 'package:roome/src/features/profile/presentation/widgets/profile_section_title.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

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
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, themeState) {
        return BlocBuilder<RoomeCubit, RoomeState>(builder: (context, state) {
          return CustomScrollView(
            physics: AppConstants.physics,
            slivers: <Widget>[
              CustomProfileAppBar(
                leftAnimationController: _leftAnimationController,
                leftSlideAnimation: _leftSlideAnimation,
                rightSlideAnimation: _rightSlideAnimation,
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 44.w),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: _leftAnimationController,
                        builder: (context, _) => SlideTransition(
                          position: _leftSlideAnimation,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Profile',
                              style: AppTextStyles.onBoardingHeadingTextStyle
                                  .copyWith(
                                fontSize: 30.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 19.h),
                      AnimatedBuilder(
                        animation: _leftSlideAnimation,
                        builder: (context, _) => SlideTransition(
                          position: _leftSlideAnimation,
                          child: Center(
                            child: CachedNetworkImage(
                              imageUrl: Helper.currentUser!.profileImage!,
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
                      SizedBox(height: 29.h),
                      ProfileSectionTitle(
                        animation: _rightSlideAnimation,
                        title: 'Personal Info',
                        themeState: themeState,
                      ),
                      SizedBox(height: 10.h),
                      PersonalInfo(rightSlideAnimation: _rightSlideAnimation),
                      SizedBox(height: 25.h),
                      ProfileSectionTitle(
                        animation: _rightSlideAnimation,
                        title: 'Contact Info',
                        themeState: themeState,
                      ),
                      SizedBox(height: 10.h),
                      ContactInfo(rightSlideAnimation: _rightSlideAnimation),
                      SizedBox(height: 25.h),
                      AnimatedBuilder(
                        animation: _leftSlideAnimation,
                        builder: (context, _) => SlideTransition(
                          position: _leftSlideAnimation,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 40.w),
                            child: ActionSlider.standard(
                              backgroundColor: AppColors.primaryColor,
                              toggleColor:
                                  themeState.brightness == Brightness.light
                                      ? Colors.white
                                      : Colors.black,
                              backgroundBorderRadius:
                                  BorderRadius.all(Radius.circular(100.r)),
                              height: 50.h,
                              slideAnimationCurve:
                                  Curves.fastLinearToSlowEaseIn,
                              action: (controller) async {
                                await _sliderButtonAction(controller, context);
                              },
                              rolling: true,
                              child: Text(
                                'Edit',
                                style: AppTextStyles.onBoardingHeadingTextStyle
                                    .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const BottomSpacer(),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
      },
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
