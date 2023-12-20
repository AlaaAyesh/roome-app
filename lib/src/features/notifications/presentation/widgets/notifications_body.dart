import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/custom_sliver_app_bar.dart';
import 'package:roome/src/core/widgets/separator_widget.dart';
import 'package:roome/src/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:roome/src/features/notifications/presentation/widgets/notifications_card.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        NotificationsCubit cubit = BlocProvider.of<NotificationsCubit>(context);

        return cubit.notifications.isNotEmpty
            ? FadeInUp(
                from: AppConstants.fadeInUpValue,
                child: CustomScrollView(
                  physics: AppConstants.physics,
                  slivers: [
                    CustomSliverAppBar(
                      titleText: 'Notifications',
                      arrowBackOnTap: () {
                        BlocProvider.of<RoomeCubit>(context)
                            .changeBottomNavToHome(context);
                        BlocProvider.of<RoomeCubit>(context).getUserData();
                      },
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(
                        top: 20.h,
                        bottom: 16.h,
                        right: 29.w,
                        left: 29.w,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.notifications.length,
                          itemBuilder: (context, index) {
                            return NotificationCard(
                              notification: cubit.notifications[index],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SeparatorWidget(height: 33.h),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : FadeInDown(
                from: AppConstants.fadeInUpValue,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 27.w, left: 14.w),
                    child: SvgPicture.asset(
                      AppAssets.imageNoNotifications,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
