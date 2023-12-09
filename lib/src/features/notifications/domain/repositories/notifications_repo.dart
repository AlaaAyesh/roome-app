import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/features/notifications/data/models/notification_model.dart';
import 'package:roome/src/features/notifications/domain/entities/add_to_notifications_params.dart';
import 'package:roome/src/features/notifications/domain/entities/remove_from_notifications_params.dart';

abstract class NotificationsRepo {
  Future<Either<Failure, NotificationsModel>> addToNotifications({
    required AddToNotificationsParams params,
  });

  Future<Either<Failure, NotificationsModel>> removeFromNotifications({
    required RemoveFromNotificationsParams params,
  });
}
