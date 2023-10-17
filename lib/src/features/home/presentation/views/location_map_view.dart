import 'package:flutter/material.dart';
import 'package:roome/src/features/home/presentation/widgets/location_map_view_body.dart';

class LocationMapView extends StatelessWidget {
  const LocationMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LocationViewBody(),
    );
  }
}
