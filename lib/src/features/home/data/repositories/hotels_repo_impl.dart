import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/errors/server_failure.dart';
import 'package:roome/src/core/models/user/hotel.dart';
import 'package:roome/src/core/internet/internet_checker.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/features/home/data/datasources/hotels/hotels_datasource.dart';
import 'package:roome/src/features/home/domain/repositories/hotels_repo.dart';

class HotelsRepoImpl implements HotelsRepo {
  final InternetChecker internetChecker;
  final HotelsDataSource hotelsDataSource;

  const HotelsRepoImpl({
    required this.internetChecker,
    required this.hotelsDataSource,
  });

  @override
  Future<Either<Failure, dynamic>> getHotels() async {
    if (await internetChecker.isConnected) {
      try {
        final response = await hotelsDataSource.getHotels();

        List<Hotel> hotels = <Hotel>[];

        for (var hotel in response) {
          hotels.add(Hotel.fromJson(hotel));
        }

        return Right(hotels);
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
