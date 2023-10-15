import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:roome/src/features/notifications/data/models/notification_model.dart';

class RemoveFromNotificationsParams extends Equatable {
  final NotificationsModel notification;
  final BuildContext context;

  const RemoveFromNotificationsParams({
    required this.notification,
    required this.context,
  });

  @override
  List<Object?> get props => [notification, context];
}
