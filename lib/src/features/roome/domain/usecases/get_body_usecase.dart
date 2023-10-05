import 'package:flutter/material.dart';

import 'package:roome/src/core/usecases/regular_usecase.dart';
import 'package:roome/src/features/roome/domain/entities/get_body_params.dart';
import 'package:roome/src/features/roome/domain/repositories/room_repo.dart';

class GetBodyUseCse implements RegularUseCases<List<Widget>, GetBodyParams> {
  final RoomRepo roomRepo;

  const GetBodyUseCse({required this.roomRepo});

  @override
  List<Widget> call(GetBodyParams params) {
    return roomRepo.getBody(
      roomeState: params.roomeState,
      roomeCubit: params.roomCubit,
    );
  }
}
