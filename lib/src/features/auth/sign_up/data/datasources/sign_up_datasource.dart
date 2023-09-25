import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/entities/user_entity.dart';

abstract class SignUpDataSource {
  Future<UserCredential> userSignUp({
    required UserEntity user,
  });

  Future<void> firestoreCreateUSer({
    required UserEntity user,
  });

  Future<UserCredential> signUpWithGoogle();
}
