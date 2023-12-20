import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/errors/server_failure.dart';
import 'package:roome/src/core/models/user/user.dart';
import 'package:roome/src/core/internet/internet_checker.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/features/roome/data/datasources/roome_datasource.dart';
import 'package:roome/src/features/roome/domain/entities/change_index_params.dart';
import 'package:roome/src/features/roome/domain/repositories/roome_repo.dart';

class RoomeRepoImpl implements RoomeRepo {
  final InternetChecker internetChecker;

  final RoomeDataSource roomeDataSource;

  const RoomeRepoImpl({
    required this.roomeDataSource,
    required this.internetChecker,
  });

  @override
  void changeBottomNavIndex({
    required ChangeIndexParams changeIndexParams,
  }) {
    roomeDataSource.changeBottomNavIndex(changeIndexParams: changeIndexParams);
  }

  @override
  void changeBottomNavToHome({
    required ChangeIndexParams changeIndexParams,
  }) {
    roomeDataSource.changeBottomNavToHome(changeIndexParams: changeIndexParams);
  }

  @override
  List<Widget> getBody() {
    return roomeDataSource.getBody();
  }

  @override
  List<BottomNavigationBarItem> getBottomNavItems() =>
      roomeDataSource.getBottomNavItems();

  @override
  Future<Either<Failure, UserModel>> getUserData({required int userId}) async {
    if (await internetChecker.isConnected) {
      final response = await roomeDataSource.getUserData(userId: userId);

      if (response.containsKey('message')) {
        return Left(ServerFailure(failureMsg: response['message']));
      } else {
        final UserModel user = UserModel.fromJson(response);

        return Right(user);
      }
    } else {
      return Left(ServerFailure(failureMsg: AppStrings.noInternet));
    }
  }
}
