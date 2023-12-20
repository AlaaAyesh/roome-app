import 'package:flutter/material.dart';
import 'package:roome/src/features/roome/domain/entities/change_index_params.dart';

abstract class RoomeDataSource {
  void changeBottomNavIndex({
    required ChangeIndexParams changeIndexParams,
  });

  void changeBottomNavToHome({required ChangeIndexParams changeIndexParams});

  List<Widget> getBody();

  List<BottomNavigationBarItem> getBottomNavItems();

  Future<Map<String, dynamic>> getUserData({required int userId});
}
