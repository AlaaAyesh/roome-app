import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '/src/core/api/api_consumer.dart';
import '/src/core/api/end_points.dart';
import '/src/features/auth/sign_up/data/datasources/sign_up_datasource.dart';

class SignUpDataSourceImpl implements SignUpDataSource {
  final ApiConsumer apiConsumer;

  const SignUpDataSourceImpl({required this.apiConsumer});

  @override
  Future<Map<String, dynamic>> userSignUp({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await apiConsumer.post(
      EndPoints.register,
      body: {
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
        'password': password,
        'profileImage':
            'https://img.freepik.com/free-icon/user_318-159711.jpg?size=626&ext=jpg&ga=GA1.2.825316313.1674289475&semt=ais',
      },
    );

    return response;
  }

  @override
  Future<UserCredential> signUpWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
