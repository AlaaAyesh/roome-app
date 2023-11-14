import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/features/notifications/data/datasources/notifications_datasource.dart';
import 'package:roome/src/features/notifications/data/models/notification_model.dart';
import 'package:roome/src/features/notifications/presentation/cubit/notifications_cubit.dart';

class NotificationsDataSourceImpl implements NotificationsDataSource {
  @override
  Future<NotificationsModel> addToNotifications({
    required String circles,
    required String icon,
    required Color color,
    required String title,
    required String body,
    required BuildContext context,
  }) async {
    final NotificationsModel notification = NotificationsModel(
      circles: circles,
      color: color,
      icon: icon,
      title: title,
      body: body,
    );

    BlocProvider.of<NotificationsCubit>(context)
        .notifications
        .add(notification);

    return notification;
  }

  @override
  Future<NotificationsModel> removeFromNotifications({
    required NotificationsModel notification,
    required BuildContext context,
  }) async {
    BlocProvider.of<NotificationsCubit>(context)
        .notifications
        .remove(notification);

    return notification;
  }
}
