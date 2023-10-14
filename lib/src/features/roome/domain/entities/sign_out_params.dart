import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SignOutParams extends Equatable {
  final BuildContext context;

  const SignOutParams({required this.context});

  @override
  List<Object?> get props => [context];
}
