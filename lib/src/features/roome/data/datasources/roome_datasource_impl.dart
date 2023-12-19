import 'package:flutter/material.dart';
import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/core/api/end_points.dart';
import 'package:roome/src/features/favorite/presentation/widgets/favorite_body.dart';
import 'package:roome/src/features/home/presentation/widgets/home_body.dart';
import 'package:roome/src/features/notifications/presentation/widgets/notifications_body.dart';
import 'package:roome/src/features/profile/presentation/widgets/profile_body.dart';
import 'package:roome/src/features/roome/data/datasources/roome_datasource.dart';
import 'package:roome/src/features/roome/domain/entities/change_index_params.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class RoomeDataSourceImpl implements RoomeDataSource {
  final ApiConsumer apiConsumer;

  const RoomeDataSourceImpl({required this.apiConsumer});

  @override
  void changeBottomNavIndex({
    required ChangeIndexParams changeIndexParams,
  }) {
    RoomeCubit.getObject(changeIndexParams.context).currentIndex =
        changeIndexParams.index!;
  }

  @override
  void changeBottomNavToHome({
    required ChangeIndexParams changeIndexParams,
  }) {
    RoomeCubit.getObject(changeIndexParams.context).currentIndex = 0;
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
      "${EndPoints.user}${userId.toString()}",
      queryParameters: {'id': userId},
    );

    return response;
  }
}
