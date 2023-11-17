import 'package:action_slider/action_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/core/widgets/custom_sliver_app_bar.dart';
import 'package:roome/src/core/widgets/get_back_arrow.dart';
import 'package:roome/src/features/profile/presentation/widgets/info_container.dart';
import 'package:roome/src/features/profile/presentation/widgets/profile_section_title.dart';
import 'package:roome/src/features/profile/presentation/widgets/user_info.dart';
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
    var size = MediaQuery.of(context).size;

    return BlocBuilder<ThemesCubit, ThemeData>(builder: (context, themeState) {
      return BlocBuilder<RoomeCubit, RoomeState>(builder: (context, state) {
        return CustomScrollView(
          physics: AppConstants.physics,
          slivers: <Widget>[
            CustomSliverAppBar(
              leading: AnimatedBuilder(
                animation: _leftAnimationController,
                builder: (context, _) => SlideTransition(
                  position: _leftSlideAnimation,
                  child: GetBackArrow(
                    onTap: () {
                      BlocProvider.of<RoomeCubit>(context)
                          .changeBottomNavToHome(context);
                      BlocProvider.of<RoomeCubit>(context).getUserData();
                    },
                  ),
                ),
              ),
              actions: <Widget>[
                AnimatedBuilder(
                  animation: _rightSlideAnimation,
                  builder: (context, _) => SlideTransition(
                    position: _rightSlideAnimation,
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<ThemesCubit>(context).toggleTheme();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(right: 24),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.24),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Icon(
                          themeState.brightness == Brightness.light
                              ? Icons.dark_mode
                              : Icons.light_mode,
                          color: AppColors.primaryColor,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
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
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 19),
                    AnimatedBuilder(
                      animation: _leftSlideAnimation,
                      builder: (context, _) => SlideTransition(
                        position: _leftSlideAnimation,
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl: Helper.currentUser!.profileImage!,
                            imageBuilder: (_, image) {
                              return CircleAvatar(
                                radius: 80,
                                backgroundColor:
                                    AppColors.primaryColor.withOpacity(0.24),
                                child: CircleAvatar(
                                  backgroundImage: image,
                                  radius: 65,
                                  backgroundColor: AppColors.primaryColor,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 29),
                    ProfileSectionTitle(
                      animation: _rightSlideAnimation,
                      title: 'Personal Info',
                      themeState: themeState,
                    ),
                    const SizedBox(height: 10),
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
                              UserInfo(
                                title: 'Occupation',
                                info: Helper.currentUser!.occupation,
                              ),
                              UserInfo(
                                title: 'Nationality',
                                info: Helper.currentUser!.nationality,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    ProfileSectionTitle(
                      animation: _rightSlideAnimation,
                      title: 'Contact Info',
                      themeState: themeState,
                    ),
                    const SizedBox(height: 10),
                    AnimatedBuilder(
                      animation: _rightSlideAnimation,
                      builder: (context, _) => SlideTransition(
                        position: _rightSlideAnimation,
                        child: InfoContainer(
                          height: 85,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              UserInfo(
                                title: 'Phone number',
                                info: Helper.currentUser!.phoneNumber,
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
                    const SizedBox(height: 25),
                    AnimatedBuilder(
                      animation: _leftSlideAnimation,
                      builder: (context, _) => SlideTransition(
                        position: _leftSlideAnimation,
                        child: Center(
                          child: ActionSlider.standard(
                            backgroundColor: AppColors.primaryColor,
                            toggleColor:
                                themeState.brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.black,
                            backgroundBorderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            height: 50,
                            width: size.width * 0.6,
                            slideAnimationCurve: Curves.fastLinearToSlowEaseIn,
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
    });
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
      end: const Offset(-200, 0),
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
      end: const Offset(200, 0),
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
