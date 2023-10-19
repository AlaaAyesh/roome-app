import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/errors/failure.dart';
import '/src/core/models/user_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserModel>> userSignIn({
    required String usernameOrEmail,
    required String password,
  });

  Future<Either<Failure, UserCredential>> signInWithGoogle();
}
