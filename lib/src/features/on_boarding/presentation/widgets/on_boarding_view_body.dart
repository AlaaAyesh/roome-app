import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:roome/src/features/on_boarding/presentation/widgets/page_view_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/app_colors.dart';

import 'on_boarding_button.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key, required this.cubit});

  final OnBoardingCubit cubit;

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight! * 0.75,
            child: PageView.builder(
              controller: pageController,
              itemCount: widget.cubit.getPages().length,
              itemBuilder: (context, index) => PageViewItem(
                pageInfo: widget.cubit.getPages()[index],
              ),
              onPageChanged: (int index) {
                widget.cubit.onChangePageIndex(index);
              },
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.025),
          SmoothPageIndicator(
            controller: pageController,
            count: widget.cubit.getPages().length,
            effect: ColorTransitionEffect(
              dotColor: Colors.grey,
              activeDotColor: AppColors.primaryColor,
              dotHeight: SizeConfig.screenHeight! * 0.008,
              dotWidth: SizeConfig.screenWidth! * 0.02,
              spacing: SizeConfig.screenWidth! * 0.015,
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.01),
          OnBoardingButton(
            onPressed: () {
              widget.cubit.navigateBetweenPages(
                context: context,
                pageController: pageController,
              );
            },
            buttonText: widget.cubit.isLastBoarding ? 'Start' : 'Next',
            padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.w),
            backgroundColor: AppColors.primaryColor,
            textStyle: AppTextStyle.onBoardingButtonStyle,
          ),
          OnBoardingButton(
            onPressed: () {
              widget.cubit.isLastBoarding
                  ? widget.cubit.previousPage(pageController: pageController)
                  : widget.cubit.navigateToLoginOrHome(context: context);
            },
            buttonText: widget.cubit.isLastBoarding ? 'Return' : 'Skip',
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
            backgroundColor: AppColors.lightWight,
            textStyle: AppTextStyle.onBoardingButtonStyle
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
