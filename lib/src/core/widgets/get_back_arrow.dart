import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_assets.dart';

class GetBackArrow extends StatelessWidget {
  const GetBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: SvgPicture.asset(AppAssets.arrowLeftIcon),
    );
  }
}
