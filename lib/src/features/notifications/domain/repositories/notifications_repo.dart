import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/features/notifications/data/models/notification_model.dart';

abstract class NotificationsRepo {
  Future<Either<Failure, NotificationsModel>> addToNotifications({
    required String circles,
    required String icon,
    required Color color,
    required String title,
    required String body,
    required BuildContext context,
  });

  Future<Either<Failure, NotificationsModel>> removeFromNotifications({
    required NotificationsModel notification,
    required BuildContext context,
  });
}
