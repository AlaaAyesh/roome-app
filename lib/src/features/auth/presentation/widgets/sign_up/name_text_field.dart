import 'package:flutter/material.dart';
import 'package:roome/src/core/helpers/auth_helper.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/custom_text_form_field.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    super.key,
    required this.controller,
    required this.thisFocusNode,
    required this.toFocusNode,
    required this.hint,
  });

  final TextEditingController controller;
  final FocusNode thisFocusNode;
  final FocusNode toFocusNode;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextFormField(
        controller: controller,
        focusNode: thisFocusNode,
        hintText: hint,
        prefix: Icon(
          Icons.person,
          size: AppConstants.authPrefixIconSize,
          color: AppConstants.authPrefixIconColor,
        ),
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        autofillHints: const <String>[AutofillHints.name],
        validating: (String? value) {
          return AuthHelper.validatingNameField(
            textName: hint,
            value: value,
          );
        },
        onEditingComplete: () {
          FocusScope.of(context).requestFocus(toFocusNode);
        },
      ),
    );
  }
}
