import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/core/entities/user_entity.dart';
import 'package:roome/src/core/errors/exceptions.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/network/network_info.dart';
import 'package:roome/src/features/auth/sign_in/data/datasources/login_datasource.dart';
import 'package:roome/src/features/auth/sign_in/domain/repositories/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final NetworkInfo networkInfo;
  final LoginDataSource loginDataSource;

  LoginRepoImpl({required this.loginDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    if (await networkInfo.isConnected) {
      try {
        final user = await loginDataSource.signInWithGoogle();
        return Right(user);
      } on ServerException {
        return Left(AuthFailure());
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Either<Failure, UserCredential>> userSignIn({
    required UserEntity user,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await loginDataSource.userSignIn(user: user);

        return Right(response);
      } on ServerException {
        return Left(AuthFailure());
      }
    } else {
      throw ServerException();
    }
  }
}
