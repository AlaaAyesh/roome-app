import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/hex_color_handler.dart';
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
          height: 100,
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 8,
            left: 4,
            right: 8,
            bottom: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: state.brightness == Brightness.light
                ? HexColorHandler('E4E4E4')
                : AppColors.darkGreyColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 4,
                offset: const Offset(0, 4),
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
                  padding: const EdgeInsets.only(top: 7),
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
                            padding: const EdgeInsets.only(top: 7),
                            child: GestureDetector(
                              onTap: () =>
                                  BlocProvider.of<NotificationsCubit>(context)
                                      .removeFromNotifications(
                                notification: notification,
                                context: context,
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Flexible(
                        child: Text(
                          notification.body,
                          style: AppTextStyles.textStyle12.copyWith(
                            fontSize: 13,
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
