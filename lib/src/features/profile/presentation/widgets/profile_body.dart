import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/features/profile/presentation/widgets/profile_body_content.dart';
import 'package:roome/src/features/profile/presentation/widgets/shimmer_profile_body.dart';
import 'package:roome/src/features/profile/presentation/widgets/sign_out_floating_button.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Helper.uId != null
        ? FadeInUp(
            from: AppConstants.fadeInUpValue,
            child: const Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                ProfileBodyContent(),
                SignOutFloatingButton(),
              ],
            ),
          )
        : const ShimmerProfileBody();
  }
}
