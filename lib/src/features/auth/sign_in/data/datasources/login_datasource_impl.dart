import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:roome/src/features/auth/sign_in/data/datasources/login_datasource.dart';

import '../../../../../core/entities/user_entity.dart';

class LoginDataSourceImpl implements LoginDataSource {
  final FirebaseAuth firebaseAuth;

  const LoginDataSourceImpl({required this.firebaseAuth});

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
  Future<UserCredential> userSignIn({
    required UserEntity user,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );
  }
}
