import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/features/booking/presentation/cubits/payment/payment_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '/src/config/themes/cubit/themes_cubit.dart';
import '/src/core/utils/app_text_styles.dart';
import 'selection_circle.dart';

class OtherPaymentMethod extends StatelessWidget {
  const OtherPaymentMethod({
    super.key,
    required this.icon,
    required this.text,
  });

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 8.h,
        bottom: 8.h,
        left: 4.w,
        right: 15.w,
      ),
      margin: EdgeInsets.only(left: 20.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            icon,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 19.w),
          BlocBuilder<ThemesCubit, ThemeData>(
            builder: (context, state) {
              return Text(
                text,
                style: AppTextStyles.hintStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  color: state.brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              );
            },
          ),
          const Spacer(),
          BlocBuilder<PaymentCubit, PaymentState>(
            builder: (context, state) {
              PaymentCubit cubit = BlocProvider.of<PaymentCubit>(context);
              return SelectionCircle(
                color: _checkPaymentMethod()
                    ? cubit.paypalCircleColor
                    : cubit.creditCircleColor,
                onTap: () => _checkPaymentMethod()
                    ? cubit.changePaypalCircleColor()
                    : cubit.changeCreditCircleColor(),
              );
            },
          ),
        ],
      ),
    );
  }

  bool _checkPaymentMethod() => text.toLowerCase().contains('paypal');
}
