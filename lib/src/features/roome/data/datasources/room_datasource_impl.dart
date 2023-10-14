import 'package:flutter/material.dart';
import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/core/api/end_points.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/src/features/profile/presentation/widgets/profile_body.dart';

import '../../../home/presentation/widgets/home_body.dart';
import '../../../favorite/presentation/widgets/favorite_body.dart';
import '../../../notifications/presentation/widgets/notifications_body.dart';
import '../../presentation/cubit/roome_cubit.dart';
import 'roome_datasource.dart';

class RoomDataSourceImpl implements RoomeDataSource {
  final ApiConsumer apiConsumer;

  const RoomDataSourceImpl({required this.apiConsumer});

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
          icon: Icon(Icons.home),
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
  Future<bool> signOut({required BuildContext context}) async {
    return await CacheHelper.removeData(key: 'uId');
  }
}
