import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/core/api/end_points.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/src/core/utils/service_locator.dart';
import 'package:roome/src/features/favorite/presentation/widgets/favorite_body.dart';
import 'package:roome/src/features/home/presentation/widgets/home_body.dart';
import 'package:roome/src/features/notifications/presentation/widgets/notifications_body.dart';
import 'package:roome/src/features/profile/presentation/widgets/profile_body.dart';
import 'package:roome/src/features/roome/data/datasources/roome_datasource.dart';
import 'package:roome/src/features/roome/domain/entities/update_user_params.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class RoomeDataSourceImpl implements RoomeDataSource {
  final ApiConsumer apiConsumer;

  const RoomeDataSourceImpl({required this.apiConsumer});

  @override
  void changeBottomNavIndex({
    required BuildContext context,
    required int index,
  }) {
    RoomeCubit.getObject(context).currentIndex = index;
  }

  @override
  void changeBottomNavToHome({
    required BuildContext context,
  }) {
    RoomeCubit.getObject(context).currentIndex = 0;
  }

  @override
  List<Widget> getBody() {
    return const <Widget>[
      HomeBody(),
      NotificationsBody(),
      FavoriteBody(),
      ProfileBody(),
    ];
  }

  @override
  List<BottomNavigationBarItem> getBottomNavItems() =>
      const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_filled),
        ),
        BottomNavigationBarItem(
          label: 'Notification',
          icon: Icon(Icons.notifications),
        ),
        BottomNavigationBarItem(
          label: 'Favorite',
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.person),
        ),
      ];

  @override
  Future<Map<String, dynamic>> getUserData({required int userId}) async {
    final response = await apiConsumer.get(
      "${EndPoints.user}/${userId.toString()}",
      queryParameters: {'id': userId},
    );

    return response;
  }

  @override
  Future<Map<String, dynamic>> updateUser({
    required int userId,
    required UpdateUserParams user,
  }) async {
    final response = await apiConsumer.put(
      '${EndPoints.user}/$userId',
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

  @override
  Future<bool> signOut({required BuildContext context}) async {
    return await serviceLocator.get<CacheHelper>().removeData(key: 'uId');
  }
}
