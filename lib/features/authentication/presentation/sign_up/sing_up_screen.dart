import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roome/core/global/app_assets.dart';
import 'package:roome/core/widget/custom_text_field.dart';
import 'package:roome/features/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:roome/features/authentication/presentation/widget/auth_custom_button.dart';
import 'package:roome/features/authentication/presentation/widget/auth_icon_button.dart';
import 'package:roome/features/introduction/presentation/screen/introduction_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String id = 'Sign Up Screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? password;
  String? email;
  String? userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(right: 24, left: 24, bottom: 24, top: 64),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.chevron_left)),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Sing up',
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
                    onChanged: (x) {
                      email = x;
                    },
                    hintText: 'Email',
                    preIcon: Icons.mail,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
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
                    onChanged: (x) {
                      password = x;
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: const Text(
                          'Forgot Password ?',
                          style: TextStyle(fontSize: 13.5, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AuthCustomButton(
                    name: 'Sing up',
                    onPressed: () async {
                      try {
                        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                        await credential.user!.updateDisplayName(userName);
                        Navigator.pushNamed(context, IntroductionScreen.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackbar(
                              context, 'The password provided is too weak');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackbar(context,
                              'The account already exists for that email.');
                        } else {
                          showSnackbar(context, e.toString());
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
                    'Already have an account ?',
                    style: TextStyle(fontSize: 13.5),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, SignInScreen.id);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Log In',
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
      ),
    );
  }
}

void showSnackbar(BuildContext context, String massage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red[800],
      content: Text(
        massage,
        style: TextStyle(color: Colors.white),
      )));
}
