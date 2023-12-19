import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/user/user.dart';
import 'package:roome/src/features/auth/domain/entities/sign_up/sign_up_parameters.dart';

abstract class SignUpRepo {
  Future<Either<Failure, UserModel>> userSignUp({
    required SignUpParameters signUpParams,
  });

  Future<Either<Failure, UserCredential>> signUpWithGoogle();
}
