import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/user_model.dart';
import 'package:roome/src/features/auth/domain/entities/login/login_parameters.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserModel>> userLogin({
    required LoginParameters loginParams,
  });

  Future<Either<Failure, UserCredential>> signInWithGoogle();
}
