import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class RememberMeCheckBox extends StatefulWidget {
  const RememberMeCheckBox({
    super.key,
  });

  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  bool isRemembered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isRemembered) {
          setState(() {
            isRemembered = !isRemembered;
          });
        } else {
          setState(() {
            isRemembered = true;
          });
        }
      },
      child: Container(
        height: 15.w,
        width: 15.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 0.56.w,
          ),
        ),
        child: Center(
          child: isRemembered
              ? Icon(
                  Icons.check,
                  color: AppColors.primaryColor,
                  size: 13.w,
                )
              : null,
        ),
      ),
    );
  }
}
