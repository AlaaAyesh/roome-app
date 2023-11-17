import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomeCubit, RoomeState>(
      builder: (context, state) {
        RoomeCubit cubit = RoomeCubit.getObject(context);
        return BlocBuilder<ThemesCubit, ThemeData>(
          builder: (context, themeState) {
            return BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) => cubit.changeBottomNavIndex(index, context),
              items: cubit.getBottomNavItems(),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.grey,
              selectedIconTheme: const IconThemeData(size: 20),
              unselectedIconTheme: const IconThemeData(size: 18),
              selectedLabelStyle: AppTextStyles.bottomNavTextStyle
                  .copyWith(color: AppColors.primaryColor),
              unselectedLabelStyle: AppTextStyles.bottomNavTextStyle.copyWith(
                color: AppColors.grey,
              ),
            );
          },
        );
      },
    );
  }
}
