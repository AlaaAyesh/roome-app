import 'package:flutter/material.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

abstract class RoomeDataSource {
  void changeBottomNavIndex({
    required BuildContext context,
    required int index,
  });

  void changeBottomNavToHome({required BuildContext context});

  List<Widget> getBody({
    required RoomeState roomeState,
    required RoomeCubit roomeCubit,
  });

  List<BottomNavigationBarItem> getBottomNavItems();

  Future<Map<String, dynamic>> getUserData({required int userId});

  Future<bool> signOut({required BuildContext context});
}
