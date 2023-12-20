import 'package:flutter/material.dart';
import 'package:roome/src/core/widgets/custom_snack_bar.dart';

class AuthHelper {
  static String? validatingPasswordField({String? value}) {
    if (value!.isEmpty) {
      return "Password can't be blank!";
    } else if (value.length < 8) {
      return "Too short password!";
    }
    return null;
  }

  static String? validatingEmailField({String? value}) {
    if (value!.isEmpty) {
      return "Email can't be blank!";
    } else if (!value.contains('@')) {
      return "Incorrect Email!";
    }

    return null;
  }

  static String? validatingNameField({
    required textName,
    String? value,
  }) {
    if (value!.isEmpty) {
      return "$textName can't be blank!";
    }
    return null;
  }

  static void keyboardUnfocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static void accountCreatedSnackBar(BuildContext context) {
    CustomSnackBar.show(
      context: context,
      message: "Account Created Successfully",
      state: CustomSnackBarState.success,
    );
  }
}
