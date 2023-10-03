import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'location_text_button.dart';

class HelloRow extends StatelessWidget {
  const HelloRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 26.w),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {}, // TODO: open Drawer
            child: Icon(Icons.menu, size: 23.w),
          ),
          SizedBox(width: SizeConfig.screenWidth! * 0.016),
          CircleAvatar(
            radius: 19.r,
            backgroundImage: const NetworkImage(AppStrings.myImageUrl),
          ),
          SizedBox(width: SizeConfig.screenWidth! * 0.016),
          const Text('\u{1F44B}'),
          SizedBox(width: SizeConfig.screenWidth! * 0.016),
          Text(
            'Hello Mariam',
            style: AppTextStyles.textStyle15.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          LocationTextButton(
            onPressed: () {},
            iconSize: 19.w,
            title: 'Location',
          ),
        ],
      ),
    );
  }
}
