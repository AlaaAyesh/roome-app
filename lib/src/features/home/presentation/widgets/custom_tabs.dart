import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/home/presentation/widgets/near_me.dart';
import 'package:roome/src/features/home/presentation/widgets/popular.dart';
import 'package:roome/src/features/home/presentation/widgets/recommended.dart';

class CustomTabs extends StatefulWidget {
  const CustomTabs({super.key});

  @override
  State<CustomTabs> createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  final List<String> tabsTitles = <String>['Near Me', 'Recommended', 'Popular'];

  int current = 0;

  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 8.h;

      case 1:
        return 90.h;

      case 2:
        return 220.h;

      default:
        return 0;
    }
  }

  double changeWidthOfLine() {
    switch (current) {
      case 0:
        return 50.w;

      case 1:
        return 100.w;

      case 2:
        return 45.w;

      default:
        return 0.w;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: SizeConfig.screenHeight! * 0.05,
          width: SizeConfig.screenWidth,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: SizedBox(
                  height: SizeConfig.screenHeight! * 0.04,
                  width: SizeConfig.screenWidth,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: tabsTitles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 10.w : 22.w,
                            top: 7.w,
                          ),
                          child: BlocBuilder<ThemesCubit, ThemeData>(
                            builder: (context, state) {
                              return Text(
                                tabsTitles[index],
                                style: AppTextStyles.hintStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: state.brightness == Brightness.light
                                      ? current == index
                                          ? Colors.black
                                          : Colors.black.withOpacity(0.34)
                                      : current == index
                                          ? Colors.white
                                          : Colors.white38,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                bottom: 0,
                left: changePositionedOfLine(),
                curve: Curves.fastLinearToSlowEaseIn,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: changeWidthOfLine(),
                  height: SizeConfig.screenHeight! * 0.008,
                  color: AppColors.primaryColor.withOpacity(0.71),
                ),
              ),
            ],
          ),
        ),
        if (current == 0) const NearMe(),
        if (current == 1) const Recommended(),
        if (current == 2) const Popular(),
      ],
    );
  }
}
