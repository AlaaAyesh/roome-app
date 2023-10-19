import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '/src/core/errors/bug.dart';
import '/src/core/errors/failure.dart';
import '/src/features/notifications/data/datasources/notifications_datasource.dart';
import '/src/features/notifications/data/models/notification_model.dart';
import '/src/features/notifications/domain/repositories/notifications_repo.dart';

class NotificationsRepoImpl extends NotificationsRepo {
  final NotificationsDataSource notificationsDataSource;

  NotificationsRepoImpl({required this.notificationsDataSource});

  @override
  Future<Either<Failure, NotificationsModel>> addToNotifications({
    required String circles,
    required String icon,
    required Color color,
    required String title,
    required String body,
    required BuildContext context,
  }) async {
    try {
      final NotificationsModel notification =
          await notificationsDataSource.addToNotifications(
        circles: circles,
        icon: icon,
        color: color,
        title: title,
        body: body,
        context: context,
      );

      return Right(notification);
    } catch (e) {
      return Left(Bug(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, NotificationsModel>> removeFromNotifications({
    required NotificationsModel notification,
    required BuildContext context,
  }) async {
    try {
      final NotificationsModel removedNotification =
          await notificationsDataSource.removeFromNotifications(
        notification: notification,
        context: context,
      );

      return Right(removedNotification);
    } catch (e) {
      return Left(Bug(errorMessage: e.toString()));
    }
  }
}
