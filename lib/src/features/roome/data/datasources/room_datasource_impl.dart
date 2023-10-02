import 'package:flutter/material.dart';
import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/core/api/end_points.dart';

import 'package:roome/src/features/roome/data/datasources/roome_datasource.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

import '../../presentation/widgets/booking_body.dart';
import '../../presentation/widgets/favorite_body.dart';
import '../../presentation/widgets/home_body.dart';
import '../../presentation/widgets/notifications_body.dart';

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
      BookingBody(),
      NotificationsBody(),
      FavoriteBody(),
    ];
  }

  @override
  List<BottomNavigationBarItem> getBottomNavItems() =>
      <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
          backgroundColor: Colors.white,
        ),
        const BottomNavigationBarItem(
          label: 'Booking',
          icon: Icon(Icons.view_list),
          backgroundColor: Colors.white,
        ),
        const BottomNavigationBarItem(
          label: 'Notification',
          icon: Icon(Icons.notifications),
          backgroundColor: Colors.white,
        ),
        const BottomNavigationBarItem(
          label: 'Favorite',
          icon: Icon(Icons.favorite),
          backgroundColor: Colors.white,
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
}
