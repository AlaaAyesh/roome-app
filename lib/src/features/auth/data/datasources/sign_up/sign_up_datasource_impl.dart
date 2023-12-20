import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/core/api/end_points.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/features/auth/data/datasources/sign_up/sign_up_datasource.dart';
import 'package:roome/src/features/auth/domain/entities/sign_up/sign_up_parameters.dart';

class SignUpDataSourceImpl implements SignUpDataSource {
  final ApiConsumer apiConsumer;

  const SignUpDataSourceImpl({required this.apiConsumer});

  @override
  Future<Map<String, dynamic>> userSignUp({
    required SignUpParameters signUpParams,
  }) async {
    final response = await apiConsumer.post(
      EndPoints.register,
      body: {
        'firstName': signUpParams.firstName,
        'lastName': signUpParams.lastName,
        'username': signUpParams.username,
        'email': signUpParams.email,
        'password': signUpParams.password,
        'profileImage': AppStrings.defaultImageUrl,
        'phoneNumber': 'Unknown',
        'occupation': 'Unknown',
        'nationality': 'Unknown',
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
