import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/entities/user_entity.dart';

abstract class LoginDataSource {
  Future<UserCredential> userSignIn({
    required UserEntity user,
  });

  Future<UserCredential> signInWithGoogle();
}
