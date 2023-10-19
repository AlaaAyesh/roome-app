import 'package:flutter/material.dart';

import '/src/core/entities/no_params.dart';
import '/src/core/usecases/regular_usecase.dart';
import '/src/features/roome/domain/repositories/roome_repo.dart';

class GetBottomNavItemsUseCase
    implements RegularUseCases<List<BottomNavigationBarItem>, NoParams> {
  final RoomeRepo roomRepo;

  const GetBottomNavItemsUseCase({required this.roomRepo});

  @override
  List<BottomNavigationBarItem> call(NoParams params) {
    return roomRepo.getBottomNavItems();
  }
}
