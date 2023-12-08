import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/widgets/custom_sliver_app_bar.dart';
import 'package:roome/src/core/widgets/get_back_arrow.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({
    super.key,
    required this.leftAnimationController,
    required this.leftSlideAnimation,
    required this.rightSlideAnimation,
  });

  final AnimationController leftAnimationController;
  final Animation<Offset> leftSlideAnimation;
  final Animation<Offset> rightSlideAnimation;

  @override
  Widget build(BuildContext context) {
    return CustomSliverAppBar(
      leading: AnimatedBuilder(
        animation: leftAnimationController,
        builder: (context, _) => SlideTransition(
          position: leftSlideAnimation,
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
        BlocBuilder<ThemesCubit, ThemeData>(
          builder: (context, themeState) {
            return AnimatedBuilder(
              animation: rightSlideAnimation,
              builder: (context, _) => SlideTransition(
                position: rightSlideAnimation,
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<ThemesCubit>(context).toggleTheme();
                  },
                  child: Container(
                    height: 40.h,
                    width: 40.h,
                    margin: EdgeInsets.only(right: 24.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.24),
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    child: Icon(
                      themeState.brightness == Brightness.light
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      color: AppColors.primaryColor,
                      size: 32.h,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
