import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:roome/src/roome_app.dart';
import 'package:roome/src/config/services/notification_service.dart';
import 'package:roome/bloc_observer.dart';
import 'package:roome/firebase_options.dart';
import 'package:roome/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();

  await ServiceLocator().setUpServiceLocator();

  NotificationService.initAwesomeNotifications();

  runApp(const RoomeApp());
}
