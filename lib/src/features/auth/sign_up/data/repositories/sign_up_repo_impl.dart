import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/core/errors/exceptions.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/network/network_info.dart';
import 'package:roome/src/features/auth/sign_up/data/datasources/sign_up_datasource.dart';
import 'package:roome/src/features/auth/sign_up/domain/repositories/sign_up_repo.dart';

import '../../../../../core/entities/user_entity.dart';

class SignUpRepoImpl extends SignUpRepo {
  final NetworkInfo networkInfo;
  final SignUpDataSource signUpDataSource;

  SignUpRepoImpl({required this.networkInfo, required this.signUpDataSource});

  @override
  Future<Either<Failure, void>> firestoreCreateUSer({
    required UserEntity user,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await signUpDataSource.firestoreCreateUSer(user: user);

        return Right(response);
      } on ServerException {
        throw AuthFailure();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Either<Failure, UserCredential>> userSignUp({
    required UserEntity user,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await signUpDataSource.userSignUp(user: user);

        return Right(response);
      } on ServerException {
        throw AuthFailure();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signUpWithGoogle() async {
    if (await networkInfo.isConnected) {
      try {
        final user = await signUpDataSource.signUpWithGoogle();
        return Right(user);
      } on ServerException {
        return Left(AuthFailure());
      }
    } else {
      throw ServerException();
    }
  }
}
