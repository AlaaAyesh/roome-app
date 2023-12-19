import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roome/src/features/profile/domain/entities/update_user_params.dart';

abstract class EditProfileDataSource {
  Future<Map<String, dynamic>> updateUser({
    required int userId,
    required UpdateUserParams user,
  });

  Future<XFile?> getProfileImage({required ImageSource source});

  Future<TaskSnapshot> uploadProfileImage({File? profileImage});
}
