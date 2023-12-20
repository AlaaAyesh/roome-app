import 'package:flutter/material.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/features/profile/presentation/widgets/info_container.dart';
import 'package:roome/src/features/profile/presentation/widgets/user_detail.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
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
            children: <Widget>[
              UserDetail(
                title: 'Your name',
                info:
                    '${Helper.currentUser!.firstName} ${Helper.currentUser!.lastName}',
              ),
              const BottomSpacer(),
              UserDetail(
                title: 'username',
                info: '${Helper.currentUser!.username}',
              ),
              const BottomSpacer(),
              UserDetail(
                title: 'Occupation',
                info: Helper.currentUser!.occupation,
              ),
              const BottomSpacer(),
              UserDetail(
                title: 'Nationality',
                info: Helper.currentUser!.nationality,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
