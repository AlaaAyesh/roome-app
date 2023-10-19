import 'package:flutter/material.dart';

import '../../../../core/models/hotel.dart';
import '/src/features/details/presentation/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    super.key,
    required this.hotel,
    required this.usingHero,
  });

  final Hotel hotel;
  final bool usingHero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: DetailsViewBody(
        hotel: hotel,
        usingHero: usingHero,
      )),
    );
  }
}
