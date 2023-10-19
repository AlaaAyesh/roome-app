import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/errors/server_failure.dart';
import '/src/core/errors/exceptions.dart';
import '/src/core/errors/failure.dart';
import '/src/core/models/user_model.dart';
import '/src/core/network/network_info.dart';
import '/src/core/utils/app_strings.dart';
import '/src/features/auth/sign_in/data/datasources/login_datasource.dart';
import '/src/features/auth/sign_in/domain/repositories/login_repo.dart';

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
      } catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      throw const ServerException(exception: AppStrings.opps);
    }
  }

  @override
  Future<Either<Failure, UserModel>> userSignIn({
    required String usernameOrEmail,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      final response = await loginDataSource.userSignIn(
        usernameOrEmail: usernameOrEmail,
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
}
