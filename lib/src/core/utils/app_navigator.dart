import 'package:flutter/material.dart';

extension AppNavigator on BuildContext {
  void navigateTo({required String routeName}) {
    Navigator.pushNamed(this, routeName);
  }

  void navigateAndReplacement({required String newRoute}) {
    Navigator.pushReplacementNamed(this, newRoute);
  }

  Future<Object?> navigateAndRemoveUntil({required String newRoute}) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      newRoute,
      (Route<dynamic> route) => false, // remove all previous routes
    );
  }

  void getBack() {
    Navigator.pop(this);
  }
}
