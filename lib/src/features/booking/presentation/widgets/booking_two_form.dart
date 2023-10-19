import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '/src/config/routes/routes.dart';
import '/src/config/themes/cubit/themes_cubit.dart';
import '/src/core/utils/app_colors.dart';
import '/src/core/utils/app_constants.dart';
import '/src/core/utils/app_navigator.dart';
import '/src/core/utils/app_text_styles.dart';
import '/src/core/widgets/custom_action_button.dart';
import '/src/features/booking/data/models/booking_info.dart';
import '/src/features/booking/presentation/widgets/section_title.dart';
import 'booking_two_text_field.dart';

class BookingTwoForm extends StatefulWidget {
  const BookingTwoForm({
    super.key,
    required this.bookingInfo,
  });

  final BookingInfo bookingInfo;

  @override
  State<BookingTwoForm> createState() => _BookingTwoFormState();
}

class _BookingTwoFormState extends State<BookingTwoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _ninCodeNameController = TextEditingController();

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  void disposeControllers() {
    _firstNameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _idController.dispose();
    _ninCodeNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildFadeInSectionTitle(title: 'FirstName'),
              SizedBox(width: SizeConfig.screenWidth! * 0.3),
              _buildFadeInSectionTitle(title: 'Surname'),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.014),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BookingTwoTextField(
                controller: _firstNameController,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.text,
              ),
              BookingTwoTextField(
                controller: _surnameController,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.text,
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.026),
          _buildFadeInSectionTitle(title: 'Email'),
          SizedBox(height: SizeConfig.screenHeight! * 0.014),
          BookingTwoTextField(
            controller: _emailController,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.emailAddress,
            width: SizeConfig.screenWidth,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.026),
          _buildFadeInSectionTitle(title: 'Phone'),
          SizedBox(height: SizeConfig.screenHeight! * 0.014),
          BookingTwoTextField(
            controller: _phoneController,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.phone,
            width: SizeConfig.screenWidth,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.021),
          _buildFadeInSectionTitle(title: 'Kindly upload any valid ID'),
          SizedBox(height: SizeConfig.screenHeight! * 0.017),
          Row(
            children: <Widget>[
              FadeInRight(
                from: AppConstants.fadeInHorizontalValue,
                child: Text(
                  'Add Attachment',
                  style: AppTextStyles.textStyle14Medium.copyWith(
                    fontWeight: FontWeight.normal,
                    color: AppColors.darkGrey,
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth! * 0.012),
              Icon(
                Icons.attach_file,
                color: AppColors.darkGrey,
                size: 22.w,
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.013),
          BlocBuilder<ThemesCubit, ThemeData>(
            builder: (context, state) {
              return BookingTwoTextField(
                hint: 'Click Here to Upload',
                hintStyle: AppTextStyles.textStyle14Medium.copyWith(
                  color: AppColors.primaryColor,
                ),
                controller: _idController,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.text,
                border: Border.all(color: AppColors.primaryColor),
                width: SizeConfig.screenWidth,
                backgroundColor: state.brightness == Brightness.light
                    ? Colors.white
                    : Colors.black,
                prefixIcon: Icon(
                  Icons.cloud_upload,
                  color: AppColors.primaryColor,
                  size: 24.w,
                ),
              );
            },
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.019),
          FadeInRight(
            from: AppConstants.fadeInHorizontalValue,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Or',
                style: AppTextStyles.textStyle14Medium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.008),
          _buildFadeInSectionTitle(title: 'Input your NIN Code'),
          SizedBox(height: SizeConfig.screenHeight! * 0.014),
          BookingTwoTextField(
            controller: _ninCodeNameController,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.text,
            width: SizeConfig.screenWidth,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.035),
          FadeInUp(
            from: AppConstants.fadeInUpValue,
            child: CustomActionButton(
              buttonText: 'Continue',
              onPressed: () => continueToPayment(),
              textStyle: AppTextStyles.textStyle15.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              backgroundColor: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  FadeInLeft _buildFadeInSectionTitle({required String title}) {
    return FadeInLeft(
      from: AppConstants.fadeInHorizontalValue,
      child: SectionTitle(title: title),
    );
  }

  void continueToPayment() {
    if (_formKey.currentState!.validate()) {
      context.navigateTo(
        routeName: Routes.paymentViewRoute,
        arguments: BookingInfo(
          firstName: _firstNameController.text.trim(),
          surname: _surnameController.text.trim(),
          email: _emailController.text,
          phoneNumber: _phoneController.text,
          checkInDate: widget.bookingInfo.checkInDate,
          checkOutDate: widget.bookingInfo.checkOutDate,
          roomType: widget.bookingInfo.roomType,
          roomNumber: widget.bookingInfo.roomNumber,
          guestNumber: widget.bookingInfo.guestNumber,
          hotelName: widget.bookingInfo.hotelName,
        ),
      );
      clearTextFields();
    }
  }

  void clearTextFields() {
    _emailController.clear();
    _firstNameController.clear();
    _surnameController.clear();
    _phoneController.clear();
    _idController.clear();
    _ninCodeNameController.clear();
  }
}
