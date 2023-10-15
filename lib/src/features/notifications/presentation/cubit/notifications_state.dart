part of 'notifications_cubit.dart';

sealed class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

final class NotificationsInitial extends NotificationsState {}

class GetNotificationsState extends NotificationsState {
  final List<NotificationsModel> notifications;

  const GetNotificationsState({required this.notifications});

  @override
  List<Object> get props => [notifications];
}

class AddToNotificationsSuccessState extends NotificationsState {
  final NotificationsModel notification;

  const AddToNotificationsSuccessState({required this.notification});

  @override
  List<Object> get props => [notification];
}

class AddToNotificationsErrorState extends NotificationsState {
  final String error;

  const AddToNotificationsErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class RemoveFromNotificationsSuccessState extends NotificationsState {
  final NotificationsModel notification;

  const RemoveFromNotificationsSuccessState({required this.notification});

  @override
  List<Object> get props => [notification];
}

class RemoveFromNotificationsErrorState extends NotificationsState {
  final String error;

  const RemoveFromNotificationsErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
