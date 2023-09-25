import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/core/entities/user_entity.dart';
import 'package:roome/src/core/errors/failure.dart';

abstract class SignUpRepo {
  Future<Either<Failure, UserCredential>> userSignUp({
    required UserEntity user,
  });

  Future<Either<Failure, void>> firestoreCreateUSer({
    required UserEntity user,
  });

  Future<Either<Failure, UserCredential>> signUpWithGoogle();
}
