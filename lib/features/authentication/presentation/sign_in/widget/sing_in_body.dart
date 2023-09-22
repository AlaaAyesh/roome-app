import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roome/core/global/app_assets.dart';
import 'package:roome/core/widget/custom_check_box.dart';
import 'package:roome/core/widget/custom_text_field.dart';
import 'package:roome/features/authentication/presentation/widget/auth_custom_button.dart';
import 'package:roome/features/authentication/presentation/widget/auth_icon_button.dart';

class SingInBody extends StatelessWidget {
  const SingInBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        CustomTextField(
            hintText: 'Username', preIcon: Icons.person, obscureText: false),
        const SizedBox(
          height: 24,
        ),
        CustomTextField(
          hintText: 'Password',
          obscureText: true,
          preIcon: Icons.lock,
          sufIconVisible: CupertinoIcons.eye_slash,
          sufIconInVisible: CupertinoIcons.eye,
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                CustomCheckBox(),
                Text(
                  'Remember Me',
                  style: TextStyle(color: Color(0xff837A7A), fontSize: 13.5),
                )
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  child: const Text(
                    'Forgot Password ?',
                    style: TextStyle(fontSize: 13.5, color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        AuthCustomButton(
          name: 'Login ',
          onPressed: () {},
        ),
        const SizedBox(
          height: 24,
        ),
        const Center(
          child: Text(
            'or',
            style: TextStyle(fontSize: 13),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AuthIconButton(
              iconName: kGoogleIcon,
              buttonName: 'Google',
              onPressed: () {},
            ),
            AuthIconButton(
              iconName: kAppleIcon,
              buttonName: 'Apple',
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
