import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/core/api/end_points.dart';
import 'package:roome/src/features/auth/data/datasources/login/login_datasource.dart';

class LoginDataSourceImpl implements LoginDataSource {
  final ApiConsumer apiConsumer;

  const LoginDataSourceImpl({required this.apiConsumer});

  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<Map<String, dynamic>> userLogin({
    required String usernameOrEmail,
    required String password,
  }) async {
    final response = await apiConsumer.post(
      EndPoints.login,
      body: {
        'username': usernameOrEmail,
        'password': password,
      },
    );

    return response;
  }
}
