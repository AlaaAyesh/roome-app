import 'package:flutter/material.dart';
import 'package:roome/src/features/home/presentation/widgets/search_location_view_body.dart';

class SearchLocationView extends StatelessWidget {
  const SearchLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchLocationViewBody(),
    );
  }
}
