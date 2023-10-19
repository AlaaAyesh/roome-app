import 'package:flutter/material.dart';

import '/src/features/home/presentation/widgets/near_me_see_all_view_body.dart';

class NearMeSeeAllView extends StatelessWidget {
  const NearMeSeeAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NearMeSeeAllViewBody(),
    );
  }
}
