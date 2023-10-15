import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AddToNotificationsParams extends Equatable {
  final String circles;
  final Color color;
  final String icon;
  final String title;
  final String body;
  final BuildContext context;

  const AddToNotificationsParams({
    required this.circles,
    required this.color,
    required this.icon,
    required this.title,
    required this.body,
    required this.context,
  });

  @override
  List<Object?> get props => [
        circles,
        color,
        icon,
        title,
        body,
        context,
      ];
}
