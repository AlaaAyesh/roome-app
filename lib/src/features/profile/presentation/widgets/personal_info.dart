import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/helpers/helper.dart';
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
          height: 170.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              UserDetail(
                title: 'Your name',
                info:
                    '${Helper.currentUser!.firstName} ${Helper.currentUser!.lastName}',
              ),
              UserDetail(
                title: 'username',
                info: '${Helper.currentUser!.username}',
              ),
              UserDetail(
                title: 'Occupation',
                info: Helper.currentUser!.occupation,
              ),
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
