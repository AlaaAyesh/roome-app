import 'package:dartz/dartz.dart';

import '../../data/models/notification_model.dart';
import '/src/core/errors/failure.dart';
import '/src/core/usecases/base_usecase.dart';
import '/src/features/notifications/domain/entities/remove_from_notifications_params.dart';
import '/src/features/notifications/domain/repositories/notifications_repo.dart';

class RemoveFromNotificationsUseCase
    implements BaseUseCases<NotificationsModel, RemoveFromNotificationsParams> {
  final NotificationsRepo notificationsRepo;

  const RemoveFromNotificationsUseCase({required this.notificationsRepo});

  @override
  Future<Either<Failure, NotificationsModel>> call(
      RemoveFromNotificationsParams params) async {
    return await notificationsRepo.removeFromNotifications(
      notification: params.notification,
      context: params.context,
    );
  }
}
