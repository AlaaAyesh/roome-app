import 'package:flutter/material.dart';
import 'package:roome/src/features/notifications/data/models/notification_model.dart';

abstract class NotificationsDataSource {
  Future<NotificationsModel> addToNotifications({
    required String circles,
    required String icon,
    required Color color,
    required String title,
    required String body,
    required BuildContext context,
  });

  Future<NotificationsModel> removeFromNotifications({
    required NotificationsModel notification,
    required BuildContext context,
  });
}
