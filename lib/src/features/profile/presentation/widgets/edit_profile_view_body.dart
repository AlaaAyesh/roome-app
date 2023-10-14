import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FadeInUp(
        from: 20.h,
        child: const Column(
          children: <Widget>[
            Center(
              child: Text('Edit profile'),
            ),
          ],
        ),
      ),
    );
  }
}
