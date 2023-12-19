import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/errors/server_failure.dart';
import 'package:roome/src/core/models/user/hotel.dart';
import 'package:roome/src/core/internet/internet_checker.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/features/home/data/datasources/near_me/near_me_datasource.dart';
import 'package:roome/src/features/home/domain/repositories/near_me_repo.dart';

class NearMeRepoImpl implements NearMeRepo {
  final InternetChecker internetChecker;
  final NearMeDataSource nearMeDataSource;

  const NearMeRepoImpl({
    required this.internetChecker,
    required this.nearMeDataSource,
  });

  @override
  Future<Either<Failure, dynamic>> getNearMeHotels({
    required int userId,
  }) async {
    if (await internetChecker.isConnected) {
      try {
        final response = await nearMeDataSource.getNearMeHotels(userId: userId);

        List<Hotel> nearMeHotels = <Hotel>[];

        for (var nearMeHotel in response) {
          nearMeHotels.add(Hotel.fromJson(nearMeHotel));
        }

        return Right(nearMeHotels);
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure.fromDioException(e));
        }
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return Left(ServerFailure(errorMessage: AppStrings.noInternet));
    }
  }
}
