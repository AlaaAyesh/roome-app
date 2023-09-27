import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpDataSource {
  Future<Map<String, dynamic>> userSignUp({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
  });

  Future<UserCredential> signUpWithGoogle();
}
