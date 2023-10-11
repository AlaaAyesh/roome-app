import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_app_bar.dart';
import 'package:roome/src/core/widgets/custom_action_button.dart';

import 'package:roome/src/features/booking/presentation/widgets/section_title.dart';

import '../../../../core/widgets/custom_dialog.dart';
import 'other_payment_method.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 42.h,
          left: 31.w,
          right: 31.w,
          bottom: 14.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomAppBar(
              spaceBetween: 100,
              title: 'Payment',
              arrowOnTap: () => context.getBack(),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.031),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SectionTitle(title: 'My Card'),
                CustomTextButton(
                  onTap: () {},
                  child: Text(
                    'Edit Card',
                    style: AppTextStyles.hintStyle.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.018),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              child: SvgPicture.asset(
                AppAssets.imageCreditCard,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
            const SectionTitle(title: 'Other Payment Method'),
            SizedBox(height: SizeConfig.screenHeight! * 0.036),
            const OtherPaymentMethod(
              icon: AppAssets.newCreditIcon,
              text: 'New credit/Debit Card',
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.035),
            const OtherPaymentMethod(
              icon: AppAssets.paypalIcon,
              text: 'Paypal',
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.1),
            CustomActionButton(
              buttonText: 'Continue',
              onPressed: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (context) => const CustomDialog(firstName: 'Ahmed'),
                );
              },
              textStyle: AppTextStyles.textStyle15.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              backgroundColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
