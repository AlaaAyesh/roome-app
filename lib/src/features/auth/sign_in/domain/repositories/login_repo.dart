import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/core/entities/user_entity.dart';

import '../../../../../core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserCredential>> userSignIn({
    required UserEntity user,
  });

  Future<Either<Failure, UserCredential>> signInWithGoogle();
}
