import 'package:flutter/material.dart';

import 'package:roome/src/core/utils/app_navigator.dart';

class GetBackArrow extends StatelessWidget {
  const GetBackArrow({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => context.getBack(),
      child: const Icon(
        Icons.arrow_back_ios_new,
      ),
    );
  }
}
