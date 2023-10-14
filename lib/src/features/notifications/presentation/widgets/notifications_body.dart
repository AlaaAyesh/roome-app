import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20.h,
      child: const Center(
        child: Text('Notifications'),
      ),
    );
  }
}
