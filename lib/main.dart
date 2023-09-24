import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/utils/firebase_options.dart';

import 'package:roome/src/core/utils/service_locator.dart';

import 'app.dart';
import 'src/core/helpers/cache_helper.dart';
import 'src/core/utils/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();

  setUpServiceLocator();

  await CacheHelper.initSharedPref();

  runApp(const RoomeApp());
}
