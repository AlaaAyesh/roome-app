import 'package:flutter/material.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:roome/src/features/on_boarding/presentation/widgets/on_boarding_button.dart';
import 'package:roome/src/features/on_boarding/presentation/widgets/page_view_item.dart';

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
    var size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Expanded(
          child: LayoutBuilder(
            builder: (_, __) {
              return PageView.builder(
                controller: pageController,
                itemCount: widget.cubit.getPages().length,
                itemBuilder: (context, index) => PageViewItem(
                  pageInfo: widget.cubit.getPages()[index],
                ),
                onPageChanged: (int index) {
                  widget.cubit.onChangePageIndex(index);
                },
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: widget.cubit.getPages().length,
          effect: ColorTransitionEffect(
            dotColor: Colors.grey,
            activeDotColor: AppColors.primaryColor,
            dotHeight: size.height * 0.008,
            dotWidth: size.width * 0.02,
            spacing: size.width * 0.015,
          ),
        ),
        const SizedBox(height: 15),
        OnBoardingButton(
          onPressed: () {
            widget.cubit.navigateBetweenPages(
              context: context,
              pageController: pageController,
            );
          },
          buttonText: widget.cubit.isLastBoarding ? 'Start' : 'Next',
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          backgroundColor: AppColors.primaryColor,
          textStyle: AppTextStyles.onBoardingButtonStyle,
        ),
        OnBoardingButton(
          onPressed: () {
            widget.cubit.isLastBoarding
                ? widget.cubit.previousPage(pageController: pageController)
                : widget.cubit.navigateToLoginOrHome(context: context);
          },
          buttonText: widget.cubit.isLastBoarding ? 'Return' : 'Skip',
          padding: const EdgeInsets.symmetric(horizontal: 10),
          backgroundColor: AppColors.lightWightColor,
          textStyle:
              AppTextStyles.onBoardingButtonStyle.copyWith(color: Colors.black),
        ),
        const BottomSpacer(),
      ],
    );
  }
}
