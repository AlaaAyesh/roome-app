import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/app_theme.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/service_locator.dart';
import 'package:roome/src/core/utils/app_strings.dart';

class ThemesCubit extends Cubit<ThemeData> {
  ThemesCubit() : super(AppTheme.lightTheme) {
    _getThemeFromPrefs();
  }

  Future<void> _saveThemeToPrefs({required ThemeData theme}) async {
    final themeIndex = theme == AppTheme.lightTheme ? 0 : 1;

    await getIt.get<CacheHelper>().saveData(
          key: AppStrings.theme,
          value: themeIndex,
        );
  }

  Future<void> _getThemeFromPrefs() async {
    final savedThemeIndex =
        getIt.get<CacheHelper>().getIntData(key: AppStrings.theme) ?? 0;

    final savedTheme =
        savedThemeIndex == 0 ? AppTheme.lightTheme : AppTheme.darkTheme;

    emit(savedTheme);
  }

  void toggleTheme() {
    emit(state.brightness == Brightness.light
        ? AppTheme.darkTheme
        : AppTheme.lightTheme);

    _saveThemeToPrefs(theme: state);
  }
}
