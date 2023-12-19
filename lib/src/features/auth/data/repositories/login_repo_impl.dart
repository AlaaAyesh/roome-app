import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/errors/server_failure.dart';
import 'package:roome/src/core/models/user/user.dart';
import 'package:roome/src/core/internet/internet_checker.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/features/auth/data/datasources/login/login_datasource.dart';
import 'package:roome/src/features/auth/domain/entities/login/login_parameters.dart';
import 'package:roome/src/features/auth/domain/repositories/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final InternetChecker internetChecker;
  final LoginDataSource loginDataSource;

  const LoginRepoImpl({
    required this.loginDataSource,
    required this.internetChecker,
  });

  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    if (await internetChecker.isConnected) {
      try {
        final user = await loginDataSource.signInWithGoogle();
        return Right(user);
      } catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return Left(ServerFailure(errorMessage: AppStrings.noInternet));
    }
  }

  @override
  Future<Either<Failure, UserModel>> userLogin({
    required LoginParameters loginParams,
  }) async {
    if (await internetChecker.isConnected) {
      final response =
          await loginDataSource.userLogin(loginParams: loginParams);

      if (response.containsKey('message')) {
        return Left(ServerFailure(errorMessage: response['message']));
      } else {
        final UserModel user = UserModel.fromJson(response);

        return Right(user);
      }
    } else {
      return Left(ServerFailure(errorMessage: AppStrings.noInternet));
    }
  }
}
