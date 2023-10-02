import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/user_model.dart';

import 'package:roome/src/features/roome/data/datasources/roome_datasource.dart';
import 'package:roome/src/features/roome/domain/repositories/room_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/app_strings.dart';

class RoomRepoImpl extends RoomRepo {
  final NetworkInfo networkInfo;

  final RoomeDataSource roomeDataSource;

  RoomRepoImpl({required this.roomeDataSource, required this.networkInfo});

  @override
  void changeBottomNavIndex({
    required BuildContext context,
    required int index,
  }) {
    roomeDataSource.changeBottomNavIndex(
      context: context,
      index: index,
    );
  }

  @override
  void changeBottomNavToHome({
    required BuildContext context,
  }) {
    roomeDataSource.changeBottomNavToHome(context: context);
  }

  @override
  List<Widget> getBody() => roomeDataSource.getBody();

  @override
  List<BottomNavigationBarItem> getBottomNavItems() =>
      roomeDataSource.getBottomNavItems();

  @override
  Future<Either<Failure, UserModel>> getUserData({required int userId}) async {
    if (await networkInfo.isConnected) {
      final response = await roomeDataSource.getUserData(userId: userId);

      if (response.containsKey('message')) {
        return Left(ServerFailure(errorMessage: response['message']));
      } else {
        final UserModel user = UserModel.fromJson(response);

        return Right(user);
      }
    } else {
      throw const ServerException(exception: AppStrings.opps);
    }
  }
}
