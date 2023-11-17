import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/user_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserModel>> userLogin({
    required String usernameOrEmail,
    required String password,
  });

  Future<Either<Failure, UserCredential>> signInWithGoogle();
}
