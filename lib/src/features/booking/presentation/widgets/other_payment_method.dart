import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/booking/presentation/cubits/payment/payment_cubit.dart';
import 'package:roome/src/features/booking/presentation/widgets/selection_circle.dart';

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
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: 4,
        right: 15,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Image.asset(icon, fit: BoxFit.cover),
          const SizedBox(width: 19),
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
