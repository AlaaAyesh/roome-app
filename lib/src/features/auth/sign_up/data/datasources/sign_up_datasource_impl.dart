import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:roome/src/features/auth/sign_up/data/datasources/sign_up_datasource.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/models/user_model.dart';

class SignUpDataSourceImpl implements SignUpDataSource {
  @override
  Future<void> firestoreCreateUSer({
    required UserEntity user,
  }) async {
    UserModel userModel = UserModel(
      name: user.name,
      email: user.email,
      uId: user.uId,
      image:
          'https://img.freepik.com/free-icon/user_318-159711.jpg?size=626&ext=jpg&ga=GA1.2.825316313.1674289475&semt=ais',
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uId)
        .set(userModel.toJson());
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

  @override
  Future<UserCredential> userSignUp({
    required UserEntity user,
  }) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );
  }
}
