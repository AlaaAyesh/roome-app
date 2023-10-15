import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/notifications/data/models/notification_model.dart';
import 'package:roome/src/features/notifications/domain/entities/add_to_notifications_params.dart';
import 'package:roome/src/features/notifications/domain/repositories/notifications_repo.dart';

class AddToNotificationsUseCase
    implements BaseUseCases<NotificationsModel, AddToNotificationsParams> {
  final NotificationsRepo notificationsRepo;

  const AddToNotificationsUseCase({required this.notificationsRepo});
  @override
  Future<Either<Failure, NotificationsModel>> call(
      AddToNotificationsParams params) async {
    return await notificationsRepo.addToNotifications(
      circles: params.circles,
      icon: params.icon,
      color: params.color,
      title: params.title,
      body: params.body,
      context: params.context,
    );
  }
}
