import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roome/features/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:roome/features/authentication/presentation/sign_up/sing_up_screen.dart';
import 'package:roome/features/introduction/presentation/screen/introduction_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:roome/firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const RoomeApp());
}
class RoomeApp extends StatelessWidget {
  const RoomeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        IntroductionScreen.id: (context) =>  const IntroductionScreen(),
        SignUpScreen.id: (context) =>  const SignUpScreen(),
        SignInScreen.id: (context) =>  const SignInScreen(),
      },
      initialRoute: IntroductionScreen.id,
    );
  }
}


