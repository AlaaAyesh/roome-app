import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/notifications/data/models/notification_model.dart';
import 'package:roome/src/features/notifications/domain/entities/remove_from_notifications_params.dart';
import 'package:roome/src/features/notifications/domain/repositories/notifications_repo.dart';

class RemoveFromNotificationsUseCase
    implements BaseUseCases<NotificationsModel, RemoveFromNotificationsParams> {
  final NotificationsRepo notificationsRepo;

  const RemoveFromNotificationsUseCase({required this.notificationsRepo});

  @override
  Future<Either<Failure, NotificationsModel>> call(
    RemoveFromNotificationsParams params,
  ) async {
    return await notificationsRepo.removeFromNotifications(
      notification: params.notification,
      context: params.context,
    );
  }
}
