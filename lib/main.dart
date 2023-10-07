import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/utils/firebase_options.dart';

import 'package:roome/src/core/utils/service_locator.dart';

import 'app.dart';
import 'src/core/helpers/cache_helper.dart';
import 'src/core/helpers/helper.dart';
import 'src/core/utils/bloc_observer.dart';

Future<void> main() async {
  // TODO: in explore and near me: display 4 or 5 hotels and display all of them in another screen which we navigate to using See All TextButton
  // TODO: don't forget to do shimmer for search
  //TODO: add animation animate_to (up) for the description of hotel in details screen

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();

  setUpServiceLocator();

  await CacheHelper.initSharedPref();

  Helper.uId = CacheHelper.getIntData(key: 'uId');

  runApp(const RoomeApp());
}
