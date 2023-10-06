import 'package:flutter/material.dart';

import 'package:roome/src/features/roome/presentation/widgets/bottom_nav_bar.dart';
import 'package:roome/src/features/roome/presentation/widgets/room_view_body.dart';

class RoomeView extends StatelessWidget {
  const RoomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: RoomViewBody()),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
