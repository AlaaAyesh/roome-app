import 'package:flutter/material.dart';
import 'package:roome/src/config/notifications/notification_service.dart';

import 'package:roome/src/features/roome/presentation/widgets/bottom_nav_bar.dart';
import 'package:roome/src/features/roome/presentation/widgets/room_view_body.dart';

class RoomeView extends StatefulWidget {
  const RoomeView({super.key});

  @override
  State<RoomeView> createState() => _RoomeViewState();
}

class _RoomeViewState extends State<RoomeView> {
  @override
  void initState() {
    NotificationService.allowNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: RoomViewBody()),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
