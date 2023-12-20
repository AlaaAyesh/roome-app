import 'package:get_it/get_it.dart';
import 'package:roome/src/config/locator/setup_for_core.dart';
import 'package:roome/src/config/locator/setup_for_cubits.dart';
import 'package:roome/src/config/locator/setup_for_datasources.dart';
import 'package:roome/src/config/locator/setup_for_external.dart';
import 'package:roome/src/config/locator/setup_for_repos.dart';
import 'package:roome/src/config/locator/setup_for_usecases.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  Future<void> setUpServiceLocator() async {
    await SetupForExternal().setUpForExternal();

    SetupForCore().setUpForCore();

    SetupForDataSources().setUpForDataSources();

    SetupForRepos().setUpForRepos();

    SetupForUseCases().setUpForUseCases();

    SetupForCubits().setUpForCubits();
  }
}
