import 'package:flutter/material.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/features/auth/presentation/widgets/reusable_text_form_field.dart';

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
      child: ReusableTextFormField(
        controller: controller,
        thisFocusNode: thisFocusNode,
        hint: hint,
        prefixIcon: Icons.person,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        validating: (String? value) {
          Helper.validatingNameField(
            textName: hint,
            context: context,
            value: value,
          );
          return null;
        },
        onEditingComplete: () {
          FocusScope.of(context).requestFocus(toFocusNode);
        },
      ),
    );
  }
}
