import 'package:flutter/material.dart';

abstract class RoomeDataSource {
  void changeBottomNavIndex({
    required BuildContext context,
    required int index,
  });

  void changeBottomNavToHome({required BuildContext context});

  List<Widget> getBody();

  List<BottomNavigationBarItem> getBottomNavItems();

  Future<Map<String, dynamic>> getUserData({required int userId});

  Future<dynamic> getFavorites({required int userId});

  Future<dynamic> removeFromFav({
    required int uId,
    required int hotelId,
  });

  Future<bool> signOut({required BuildContext context});
}
