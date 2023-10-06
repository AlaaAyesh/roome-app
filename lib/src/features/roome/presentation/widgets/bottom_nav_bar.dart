import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomeCubit, RoomeState>(
      builder: (context, state) {
        RoomeCubit cubit = RoomeCubit.getObject(context);
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 2.h,
          currentIndex: cubit.currentIndex,
          onTap: (index) => cubit.changeBottomNavIndex(index, context),
          items: cubit.getBottomNavItems(),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.grey,
          selectedIconTheme: IconThemeData(size: 20.w),
          unselectedIconTheme: IconThemeData(size: 18.w),
          selectedLabelStyle: AppTextStyles.bottomNavTextStyle
              .copyWith(color: AppColors.primaryColor),
          unselectedLabelStyle: AppTextStyles.bottomNavTextStyle.copyWith(
            color: AppColors.grey,
          ),
        );
      },
    );
  }
}
