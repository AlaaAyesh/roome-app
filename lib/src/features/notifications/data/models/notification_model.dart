import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NotificationsModel extends Equatable {
  final String circles;
  final Color color;
  final String icon;
  final String title;
  final String body;

  const NotificationsModel({
    required this.circles,
    required this.color,
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  List<Object?> get props => [
        circles,
        color,
        icon,
        title,
        body,
      ];
}
