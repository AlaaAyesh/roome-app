import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDataSource {
  Future<Map<String, dynamic>> userSignIn({
    required String username,
    required String password,
  });

  Future<UserCredential> signInWithGoogle();
}
