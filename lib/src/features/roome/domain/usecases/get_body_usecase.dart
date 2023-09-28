import 'package:flutter/material.dart';
import 'package:roome/src/core/entities/no_params.dart';

import 'package:roome/src/core/usecases/regular_usecase.dart';
import 'package:roome/src/features/roome/domain/repositories/room_repo.dart';

class GetBodyUseCse implements RegularUseCases<List<Widget>, NoParams> {
  final RoomRepo roomRepo;

  const GetBodyUseCse({required this.roomRepo});

  @override
  List<Widget> call(NoParams params) {
    return roomRepo.getBody();
  }
}
