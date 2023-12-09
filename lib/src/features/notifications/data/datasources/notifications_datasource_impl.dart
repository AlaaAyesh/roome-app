import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/features/notifications/data/datasources/notifications_datasource.dart';
import 'package:roome/src/features/notifications/data/models/notification_model.dart';
import 'package:roome/src/features/notifications/domain/entities/add_to_notifications_params.dart';
import 'package:roome/src/features/notifications/domain/entities/remove_from_notifications_params.dart';
import 'package:roome/src/features/notifications/presentation/cubit/notifications_cubit.dart';

class NotificationsDataSourceImpl implements NotificationsDataSource {
  @override
  Future<NotificationsModel> addToNotifications({
    required AddToNotificationsParams params,
  }) async {
    final NotificationsModel notification = NotificationsModel(
      circles: params.circles,
      color: params.color,
      icon: params.icon,
      title: params.title,
      body: params.body,
    );

    BlocProvider.of<NotificationsCubit>(params.context)
        .notifications
        .add(notification);

    return notification;
  }

  @override
  Future<NotificationsModel> removeFromNotifications({
    required RemoveFromNotificationsParams params,
  }) async {
    BlocProvider.of<NotificationsCubit>(params.context)
        .notifications
        .remove(params.notification);

    return params.notification;
  }
}
