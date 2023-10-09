import 'package:dartz/dartz.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:roome/src/core/errors/exceptions.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/user_model.dart';
import 'package:roome/src/core/network/network_info.dart';
import 'package:roome/src/features/auth/sign_up/data/datasources/sign_up_datasource.dart';
import 'package:roome/src/features/auth/sign_up/domain/repositories/sign_up_repo.dart';

import '../../../../../core/errors/server_failure.dart';
import '../../../../../core/utils/app_strings.dart';

class SignUpRepoImpl extends SignUpRepo {
  final NetworkInfo networkInfo;
  final SignUpDataSource signUpDataSource;

  SignUpRepoImpl({required this.networkInfo, required this.signUpDataSource});

  @override
  Future<Either<Failure, UserModel>> userSignUp({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      final response = await signUpDataSource.userSignUp(
        firstName: firstName,
        lastName: lastName,
        username: username,
        email: email,
        password: password,
      );

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

  @override
  Future<Either<Failure, UserCredential>> signUpWithGoogle() async {
    if (await networkInfo.isConnected) {
      try {
        final user = await signUpDataSource.signUpWithGoogle();
        return Right(user);
      } catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      throw const ServerException(exception: AppStrings.opps);
    }
  }
}
