import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/core/api/end_points.dart';
import 'package:roome/src/features/profile/data/datasources/edit_profile/edit_profile_datasource.dart';
import 'package:roome/src/features/profile/domain/entities/update_user_params.dart';

class EditProfileDataSourceImpl implements EditProfileDataSource {
  final ApiConsumer apiConsumer;

  const EditProfileDataSourceImpl({required this.apiConsumer});

  @override
  Future<Map<String, dynamic>> updateUser({
    required int userId,
    required UpdateUserParams user,
  }) async {
    final response = await apiConsumer.put(
      '${EndPoints.user}$userId',
      queryParameters: {
        'id': userId,
      },
      body: {
        "firstName": user.firstName,
        "lastName": user.lastName,
        "username": user.username,
        "email": user.email,
        "password": user.password,
        "role_id": 1,
        "profileImage": user.profileImage,
        "nationality": user.nationality,
        "phoneNumber": user.phoneNumber,
        "occupation": user.occupation,
      },
    );
    return response;
  }

  @override
  Future<XFile?> getProfileImage({required ImageSource source}) async {
    return await ImagePicker().pickImage(source: source);
  }

  @override
  Future<TaskSnapshot> uploadProfileImage({File? profileImage}) async {
    return await firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
          'users_images/${Uri.file(profileImage!.path).pathSegments.last}',
        )
        .putFile(profileImage);
  }
}
