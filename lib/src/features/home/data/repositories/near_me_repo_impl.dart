import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/features/home/data/datasources/near_me/near_me_datasource.dart';
import 'package:roome/src/features/home/domain/repositories/near_me_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/models/hotel.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/app_strings.dart';

class NearMeRepoImpl extends NearMeRepo {
  final NetworkInfo networkInfo;
  final NearMeDataSource nearMeDataSource;

  NearMeRepoImpl({required this.networkInfo, required this.nearMeDataSource});

  @override
  Future<Either<Failure, dynamic>> getNearMeHotels({
    required int userId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await nearMeDataSource.getNearMeHotels(userId: userId);

        List<Hotel> nearMeHotels = <Hotel>[];

        for (var nearMeHotel in response) {
          nearMeHotels.add(Hotel.fromJson(nearMeHotel));
        }

        return Right(nearMeHotels);
      } catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      throw const ServerException(exception: AppStrings.opps);
    }
  }
}
