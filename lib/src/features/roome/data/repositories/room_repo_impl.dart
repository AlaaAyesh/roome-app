import 'package:flutter/material.dart';

import 'package:roome/src/features/roome/data/datasources/roome_datasource.dart';
import 'package:roome/src/features/roome/domain/repositories/room_repo.dart';

class RoomRepoImpl extends RoomRepo {
  final RoomeDataSource roomeDataSource;

  RoomRepoImpl({required this.roomeDataSource});

  @override
  void changeBottomNavIndex({
    required BuildContext context,
    required int index,
  }) {
    roomeDataSource.changeBottomNavIndex(
      context: context,
      index: index,
    );
  }

  @override
  void changeBottomNavToHome({
    required BuildContext context,
  }) {
    roomeDataSource.changeBottomNavToHome(context: context);
  }

  @override
  List<Widget> getBody() => roomeDataSource.getBody();

  @override
  List<BottomNavigationBarItem> getBottomNavItems() =>
      roomeDataSource.getBottomNavItems();
}
