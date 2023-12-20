import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/features/auth/domain/entities/sign_up/sign_up_parameters.dart';

abstract class SignUpDataSource {
  Future<Map<String, dynamic>> userSignUp({
    required SignUpParameters signUpParams,
  });

  Future<UserCredential> signUpWithGoogle();
}
