import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/separator_widget.dart';
import '../../../roome/presentation/cubit/roome_cubit.dart';
import '../cubit/notifications_cubit.dart';
import 'notifications_card.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              BlocBuilder<NotificationsCubit, NotificationsState>(
                builder: (context, state) {
                  NotificationsCubit cubit =
                      BlocProvider.of<NotificationsCubit>(context);

                  return cubit.notifications.isNotEmpty
                      ? ListView.separated(
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
                        )
                      : Center(
                          child: BlocBuilder<ThemesCubit, ThemeData>(
                            builder: (context, state) {
                              return Text(
                                'You have no notifications yet. ',
                                style: AppTextStyles.snackBarTitle.copyWith(
                                  color: state.brightness == Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              );
                            },
                          ),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
