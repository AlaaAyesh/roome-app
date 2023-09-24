import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDataSource {
  Future<UserCredential> userSignIn({
    required String email,
    required String password,
  });

  Future<UserCredential> signInWithGoogle();
}
