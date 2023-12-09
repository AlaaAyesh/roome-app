import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/features/auth/domain/entities/login/login_parameters.dart';

abstract class LoginDataSource {
  Future<Map<String, dynamic>> userLogin({
    required LoginParameters loginParams,
  });

  Future<UserCredential> signInWithGoogle();
}
