import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/errors/server_failure.dart';
import 'package:roome/src/core/models/user/user.dart';
import 'package:roome/src/core/internet/internet_checker.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/features/auth/data/datasources/sign_up/sign_up_datasource.dart';
import 'package:roome/src/features/auth/domain/entities/sign_up/sign_up_parameters.dart';
import 'package:roome/src/features/auth/domain/repositories/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  final InternetChecker internetChecker;
  final SignUpDataSource signUpDataSource;

  const SignUpRepoImpl({
    required this.internetChecker,
    required this.signUpDataSource,
  });

  @override
  Future<Either<Failure, UserModel>> userSignUp({
    required SignUpParameters signUpParams,
  }) async {
    if (await internetChecker.isConnected) {
      final response = await signUpDataSource.userSignUp(
        signUpParams: signUpParams,
      );

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

  @override
  Future<Either<Failure, UserCredential>> signUpWithGoogle() async {
    if (await internetChecker.isConnected) {
      try {
        final user = await signUpDataSource.signUpWithGoogle();
        return Right(user);
      } catch (e) {
        return Left(ServerFailure(failureMsg: e.toString()));
      }
    } else {
      return Left(ServerFailure(failureMsg: AppStrings.noInternet));
    }
  }
}
