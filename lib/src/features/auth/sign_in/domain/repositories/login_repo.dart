import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/login_params.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserCredential>> userSignIn({
    required LoginParameters parameters,
  });

  Future<Either<Failure, UserCredential>> signInWithGoogle();
}
