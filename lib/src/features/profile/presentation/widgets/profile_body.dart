import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '/src/core/utils/app_constants.dart';
import 'profile_body_content.dart';
import 'sign_out_floating_button.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: AppConstants.fadeInUpValue,
      child: const Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          ProfileBodyContent(),
          SignOutFloatingButton(),
        ],
      ),
    );
  }
}
