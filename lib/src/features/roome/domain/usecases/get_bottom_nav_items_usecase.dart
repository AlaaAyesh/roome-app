import 'package:flutter/material.dart';
import 'package:roome/src/core/entities/no_params.dart';

import 'package:roome/src/core/usecases/regular_usecase.dart';
import 'package:roome/src/features/roome/domain/repositories/room_repo.dart';

class GetBottomNavItemsUseCase
    implements RegularUseCases<List<BottomNavigationBarItem>, NoParams> {
  final RoomRepo roomRepo;

  const GetBottomNavItemsUseCase({required this.roomRepo});

  @override
  List<BottomNavigationBarItem> call(NoParams params) {
    return roomRepo.getBottomNavItems();
  }
}
