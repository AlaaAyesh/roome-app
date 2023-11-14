import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/user_model.dart';

abstract class SignUpRepo {
  Future<Either<Failure, UserModel>> userSignUp({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserCredential>> signUpWithGoogle();
}
