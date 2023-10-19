import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/src/config/services/notification_service.dart';
import '/src/core/utils/firebase_options.dart';
import '/src/core/utils/service_locator.dart';
import 'app.dart';
import 'src/core/helpers/cache_helper.dart';
import 'src/core/helpers/helper.dart';
import 'src/core/utils/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  NotificationService.initAwesomeNotifications();

  Bloc.observer = MyBlocObserver();

  setUpServiceLocator();

  await CacheHelper.initSharedPref();

  Helper.uId = CacheHelper.getIntData(key: 'uId');

  runApp(const RoomeApp());
}
