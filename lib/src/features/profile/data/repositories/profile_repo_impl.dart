import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/errors/server_failure.dart';
import 'package:roome/src/features/profile/data/datasources/profile/profile_datasource.dart';
import 'package:roome/src/features/profile/domain/repositories/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileDataSource profileDataSource;

  const ProfileRepoImpl({required this.profileDataSource});

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      final result = await profileDataSource.signOut();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
