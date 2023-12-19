import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/core/widgets/main_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:roome/src/features/on_boarding/presentation/widgets/page_view_item.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
      OnBoardingCubit cubit = BlocProvider.of<OnBoardingCubit>(context);
      return Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: cubit.getPages().length,
              itemBuilder: (context, index) => PageViewItem(
                pageInfo: cubit.getPages()[index],
              ),
              onPageChanged: (int index) {
                cubit.onChangePageIndex(index);
              },
            ),
          ),
          SizedBox(height: 63.h),
          SmoothPageIndicator(
            controller: pageController,
            count: cubit.getPages().length,
            effect: ColorTransitionEffect(
              dotColor: Colors.grey,
              activeDotColor: AppColors.primaryColor,
              dotHeight: size.height * 0.008,
              dotWidth: size.width * 0.02,
              spacing: size.width * 0.015,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 18.w),
            child: MainButton(
              onPressed: () {
                cubit.navigateBetweenPages(
                  context: context,
                  pageController: pageController,
                );
              },
              text: cubit.isLastBoarding ? 'Start' : 'Next',
              textStyle: AppTextStyles.onBoardingButtonStyle,
              borderRadius: 50,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: MainButton(
              onPressed: () {
                cubit.isLastBoarding
                    ? cubit.previousPage(pageController: pageController)
                    : cubit.skipToLogin(context: context);
              },
              text: cubit.isLastBoarding ? 'Return' : 'Skip',
              backgroundColor: AppColors.lightWightColor,
              textStyle: AppTextStyles.onBoardingButtonStyle
                  .copyWith(color: Colors.black),
              borderRadius: 50,
            ),
          ),
          const BottomSpacer(height: 24),
        ],
      );
    });
  }
}
