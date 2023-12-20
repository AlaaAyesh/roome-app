import 'package:flutter/material.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/features/profile/presentation/widgets/info_container.dart';
import 'package:roome/src/features/profile/presentation/widgets/user_detail.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    super.key,
    required this.rightSlideAnimation,
  });

  final Animation<Offset> rightSlideAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: rightSlideAnimation,
      builder: (context, _) => SlideTransition(
        position: rightSlideAnimation,
        child: InfoContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              UserDetail(
                title: 'Phone number',
                info: Helper.currentUser!.phoneNumber,
              ),
              const BottomSpacer(),
              UserDetail(
                title: 'Email',
                info: Helper.currentUser!.email,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
