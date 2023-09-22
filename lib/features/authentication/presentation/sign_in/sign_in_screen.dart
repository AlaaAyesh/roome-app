import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roome/core/global/app_assets.dart';
import 'package:roome/core/widget/custom_check_box.dart';
import 'package:roome/core/widget/custom_text_field.dart';
import 'package:roome/features/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:roome/features/authentication/presentation/sign_in/widget/sing_in_body.dart';
import 'package:roome/features/authentication/presentation/sign_up/sing_up_screen.dart';
import 'package:roome/features/authentication/presentation/widget/auth_custom_button.dart';
import 'package:roome/features/authentication/presentation/widget/auth_icon_button.dart';
import 'package:roome/features/introduction/presentation/screen/introduction_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static String id = 'Sign In Screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final String password;
  late final String userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(right: 24, left: 24, bottom: 24, top: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_left)),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Log In',
              style: TextStyle(
                fontSize: 24,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                CustomTextField(
                    onChanged: (p0) {
                      userName = p0;
                    },
                    hintText: 'Username',
                    preIcon: Icons.person,
                    obscureText: false),
                const SizedBox(
                  height: 24,
                ),
                CustomTextField(
                  onChanged: (p0) {
                    password = p0;
                  },
                  hintText: 'Password',
                  obscureText: true,
                  preIcon: Icons.lock,
                  sufIconVisible: CupertinoIcons.eye_slash,
                  sufIconInVisible: CupertinoIcons.eye,
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        CustomCheckBox(),
                        Text(
                          'Remember Me',
                          style: TextStyle(
                              color: Color(0xff837A7A), fontSize: 13.5),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: const Text(
                            'Forgot Password ?',
                            style:
                                TextStyle(fontSize: 13.5, color: Colors.black),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                AuthCustomButton(
                  name: 'Login ',
                  onPressed: () async {
                    try {
                      final UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                        email: userName,
                        password: password,
                      );
                      Navigator.pushNamed(context, IntroductionScreen.id);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showSnackbar(context, 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        showSnackbar(
                            context, 'Wrong password provided for that user.');
                      }
                    } catch (e) {
                      showSnackbar(context, e.toString());
                    }
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                const Center(
                  child: Text(
                    'or',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AuthIconButton(
                      iconName: kGoogleIcon,
                      buttonName: 'Google',
                      onPressed: () {},
                    ),
                    AuthIconButton(
                      iconName: kAppleIcon,
                      buttonName: 'Apple',
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don’t have an account ?',
                  style: TextStyle(fontSize: 13.5),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpScreen.id);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
