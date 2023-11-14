import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/features/notifications/data/models/notification_model.dart';
import 'package:roome/src/features/notifications/domain/entities/add_to_notifications_params.dart';
import 'package:roome/src/features/notifications/domain/entities/remove_from_notifications_params.dart';
import 'package:roome/src/features/notifications/domain/usecases/add_to_notifications_usecase.dart';
import 'package:roome/src/features/notifications/domain/usecases/remove_from_notifications_usecase.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final AddToNotificationsUseCase addToNotificationsUseCase;
  final RemoveFromNotificationsUseCase removeFromNotificationsUseCase;

  NotificationsCubit({
    required this.addToNotificationsUseCase,
    required this.removeFromNotificationsUseCase,
  }) : super(NotificationsInitial());

  List<NotificationsModel> notifications = <NotificationsModel>[];

  void getNotifications() {
    emit(GetNotificationsState(notifications: notifications));
  }

  void addToNotifications({
    required String circles,
    required String icon,
    required Color color,
    required String title,
    required String body,
    required BuildContext context,
  }) {
    addToNotificationsUseCase(AddToNotificationsParams(
      circles: circles,
      color: color,
      icon: icon,
      title: title,
      body: body,
      context: context,
    )).then((value) {
      value.fold(
        (failure) => emit(
          AddToNotificationsErrorState(error: failure.errorMessage.toString()),
        ),
        (notification) {
          getNotifications();
          emit(AddToNotificationsSuccessState(notification: notification));
        },
      );
    });
  }

  void removeFromNotifications({
    required NotificationsModel notification,
    required BuildContext context,
  }) {
    removeFromNotificationsUseCase(
      RemoveFromNotificationsParams(
        notification: notification,
        context: context,
      ),
    ).then((value) {
      value.fold(
        (failure) => emit(
          RemoveFromNotificationsErrorState(
              error: failure.errorMessage.toString()),
        ),
        (notification) {
          getNotifications();
          emit(RemoveFromNotificationsSuccessState(notification: notification));
        },
      );
    });
  }
}
