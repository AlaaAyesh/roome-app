import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:roome/src/features/roome/domain/entities/update_user_params.dart';

abstract class RoomeDataSource {
  void changeBottomNavIndex({
    required BuildContext context,
    required int index,
  });

  void changeBottomNavToHome({required BuildContext context});

  List<Widget> getBody();

  List<BottomNavigationBarItem> getBottomNavItems();

  Future<Map<String, dynamic>> getUserData({required int userId});

  Future<Map<String, dynamic>> updateUser({
    required int userId,
    required UpdateUserParams user,
  });

  Future<XFile?> getProfileImage({required ImageSource source});

  Future<bool> signOut({required BuildContext context});
}
