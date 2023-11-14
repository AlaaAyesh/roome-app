import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/notifications/data/models/notification_model.dart';
import 'package:roome/src/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:roome/src/features/notifications/presentation/widgets/notification_status_container.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notification,
  });

  final NotificationsModel notification;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Container(
          height: 100.h,
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.only(
            top: 8.h,
            left: 4.w,
            right: 8.w,
            bottom: 8.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            color: state.brightness == Brightness.light
                ? HexColorHandler('E4E4E4')
                : AppColors.darkGreyColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 4.w,
                offset: Offset(0, 4.w),
                color: Colors.black.withOpacity(0.25),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              NotificationStatusContainer(
                circles: notification.circles,
                color: notification.color,
                icon: notification.icon,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 7.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              notification.title,
                              style: AppTextStyles.textStyle15.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 7.h),
                            child: GestureDetector(
                              onTap: () =>
                                  BlocProvider.of<NotificationsCubit>(context)
                                      .removeFromNotifications(
                                notification: notification,
                                context: context,
                              ),
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 22.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.screenHeight! * 0.01),
                      Flexible(
                        child: Text(
                          notification.body,
                          style: AppTextStyles.textStyle12.copyWith(
                            fontSize: 13.sp,
                            color: state.brightness == Brightness.light
                                ? Colors.black.withOpacity(0.6)
                                : AppColors.white60,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
