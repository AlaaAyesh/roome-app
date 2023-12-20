import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/errors/server_failure.dart';
import 'package:roome/src/features/notifications/data/datasources/notifications_datasource.dart';
import 'package:roome/src/features/notifications/data/models/notification_model.dart';
import 'package:roome/src/features/notifications/domain/entities/add_to_notifications_params.dart';
import 'package:roome/src/features/notifications/domain/entities/remove_from_notifications_params.dart';
import 'package:roome/src/features/notifications/domain/repositories/notifications_repo.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  final NotificationsDataSource notificationsDataSource;

  const NotificationsRepoImpl({required this.notificationsDataSource});

  @override
  Future<Either<Failure, NotificationsModel>> addToNotifications({
    required AddToNotificationsParams params,
  }) async {
    try {
      final NotificationsModel notification =
          await notificationsDataSource.addToNotifications(params: params);

      return Right(notification);
    } catch (e) {
      return Left(ServerFailure(failureMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, NotificationsModel>> removeFromNotifications({
    required RemoveFromNotificationsParams params,
  }) async {
    try {
      final NotificationsModel removedNotification =
          await notificationsDataSource.removeFromNotifications(params: params);

      return Right(removedNotification);
    } catch (e) {
      return Left(ServerFailure(failureMsg: e.toString()));
    }
  }
}
