import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final List<String> _tabsTitles = <String>[
    'Near Me',
    'Recommended',
    'Popular'
  ];

  int _currentTab = 0;

  double _changePositionedOfLine() {
    switch (_currentTab) {
      case 0:
        return 13.w;

      case 1:
        return 105.w;

      case 2:
        return 260.w;

      default:
        return 0;
    }
  }

  double _changeWidthOfLine() {
    switch (_currentTab) {
      case 0:
        return 50.w;

      case 1:
        return 100.w;

      case 2:
        return 45.w;

      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 40.h,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: SizedBox(
                  height: 40.h,
                  width: double.infinity,
                  child: Row(
                    children: List.generate(
                      _tabsTitles.length,
                      growable: false,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentTab = index;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 10.w : 22.w,
                            bottom: 7.h,
                          ),
                          child: BlocBuilder<ThemesCubit, ThemeData>(
                            builder: (context, state) {
                              return Text(
                                _tabsTitles[index],
                                style: AppTextStyles.hintStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: state.brightness == Brightness.light
                                      ? _currentTab == index
                                          ? Colors.black
                                          : Colors.black.withOpacity(0.34)
                                      : _currentTab == index
                                          ? Colors.white
                                          : Colors.white38,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                bottom: 0,
                left: _changePositionedOfLine(),
                curve: Curves.fastLinearToSlowEaseIn,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: _changeWidthOfLine(),
                  height: 8.h,
                  color: AppColors.primaryColor.withOpacity(0.71),
                ),
              ),
            ],
          ),
        ),
        if (_currentTab == 0) const NearMe(),
        if (_currentTab == 1) const Recommended(),
        if (_currentTab == 2) const Popular(),
      ],
    );
  }
}
