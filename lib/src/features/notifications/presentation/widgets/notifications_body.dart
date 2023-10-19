import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/separator_widget.dart';
import '../../../roome/presentation/cubit/roome_cubit.dart';
import '../cubit/notifications_cubit.dart';
import '/src/core/utils/app_constants.dart';
import 'notifications_card.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        NotificationsCubit cubit = BlocProvider.of<NotificationsCubit>(context);

        return cubit.notifications.isNotEmpty
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: FadeInUp(
                  from: AppConstants.fadeInUpValue,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 40.h,
                      bottom: 16.h,
                      right: 29.w,
                      left: 29.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomAppBar(
                          spaceBetween: 40,
                          title: 'Notifications',
                          arrowOnTap: () {
                            BlocProvider.of<RoomeCubit>(context)
                                .changeBottomNavToHome(context);
                            BlocProvider.of<RoomeCubit>(context).getUserData();
                          },
                        ),
                        SizedBox(height: SizeConfig.screenHeight! * 0.04),
                        ListView.separated(
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
                              const SeparatorWidget(height: 33),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : FadeInDown(
                from: AppConstants.fadeInUpValue,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 40.h,
                      bottom: 16.h,
                      right: 27.w,
                      left: 14.w,
                    ),
                    child: SvgPicture.asset(
                      AppAssets.imageNoNotifications,
                      fit: BoxFit.contain,
                      height: SizeConfig.screenHeight! * 0.5,
                      width: SizeConfig.screenWidth,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
