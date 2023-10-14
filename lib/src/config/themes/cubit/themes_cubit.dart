import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';

import '../app_theme.dart';

class ThemesCubit extends Cubit<ThemeData> {
  ThemesCubit() : super(AppTheme.darkTheme) {
    _getThemeFromPrefs();
  }

  Future<void> _saveThemeToPrefs({required ThemeData theme}) async {
    final themeIndex = theme == AppTheme.lightTheme ? 0 : 1;

    await CacheHelper.saveData(key: 'theme', value: themeIndex);
  }

  Future<void> _getThemeFromPrefs() async {
    final savedThemeIndex = CacheHelper.getIntData(key: 'theme') ?? 0;

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
