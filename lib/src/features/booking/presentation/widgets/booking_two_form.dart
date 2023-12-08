import 'package:animate_do/animate_do.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/router/routes.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/main_button.dart';
import 'package:roome/src/features/booking/data/models/booking_info.dart';
import 'package:roome/src/features/booking/presentation/widgets/booking_two_text_field.dart';
import 'package:roome/src/features/booking/presentation/widgets/section_title.dart';

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
  late final GlobalKey<FormState> _formKey;
  late AutovalidateMode autoValidateMode;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _ninCodeNameController = TextEditingController();

  @override
  void initState() {
    _initFormAttributes();
    super.initState();
  }

  void _initFormAttributes() {
    _formKey = GlobalKey<FormState>();
    autoValidateMode = AutovalidateMode.disabled;
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildFadeInSectionTitle(title: 'First Name'),
          SizedBox(height: 14.h),
          BookingTwoTextField(
            controller: _firstNameController,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.text,
            validating: (String? val) {
              return _validateBlankFields(val);
            },
          ),
          SizedBox(height: 26.h),
          _buildFadeInSectionTitle(title: 'Surname'),
          SizedBox(height: 14.h),
          BookingTwoTextField(
            controller: _surnameController,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.text,
            validating: (String? val) {
              return _validateBlankFields(val);
            },
          ),
          SizedBox(height: 26.h),
          _buildFadeInSectionTitle(title: 'Email'),
          SizedBox(height: 14.h),
          BookingTwoTextField(
            controller: _emailController,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.emailAddress,
            validating: (String? val) {
              if (val!.isEmpty) {
                return "Can't be blank!";
              } else if (!val.contains('@')) {
                return "Incorrect email";
              }

              return null;
            },
          ),
          SizedBox(height: 26.h),
          _buildFadeInSectionTitle(title: 'Phone'),
          SizedBox(height: 14.h),
          BookingTwoTextField(
            controller: _phoneController,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.phone,
            validating: (String? val) {
              return _validateBlankFields(val);
            },
          ),
          SizedBox(height: 21.h),
          _buildFadeInSectionTitle(title: 'Kindly upload any valid ID'),
          SizedBox(height: 17.h),
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
              SizedBox(width: 12.w),
              FadeInRight(
                from: AppConstants.fadeInHorizontalValue,
                child: Icon(
                  Icons.attach_file,
                  color: AppColors.darkGrey,
                  size: 22.h,
                ),
              ),
            ],
          ),
          SizedBox(height: 13.h),
          BlocBuilder<ThemesCubit, ThemeData>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => _pickFile(),
                child: BookingTwoTextField(
                  enabled: false,
                  hint: 'Click Here to Upload',
                  controller: _idController,
                  textCapitalization: TextCapitalization.none,
                  keyboardType: TextInputType.text,
                  validating: (String? val) {
                    return _validateBlankFields(val);
                  },
                  prefixIcon: Icon(
                    Icons.cloud_upload,
                    color: AppColors.primaryColor,
                    size: 24.h,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 19.h),
          FadeInRight(
            from: AppConstants.fadeInHorizontalValue,
            child: Center(
              child: Text(
                'Or',
                style: AppTextStyles.textStyle14Medium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          _buildFadeInSectionTitle(title: 'Input your NIN Code'),
          SizedBox(height: 14.h),
          BookingTwoTextField(
            controller: _ninCodeNameController,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            validating: (String? val) {
              return _validateBlankFields(val);
            },
          ),
          SizedBox(height: 35.h),
          FadeInUp(
            from: AppConstants.fadeInUpValue,
            child: MainButton(
              text: 'Continue',
              onPressed: () => _continueToPayment(),
            ),
          ),
        ],
      ),
    );
  }

  void _pickFile() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles();
    if (pickedFile != null) {
      PlatformFile file = pickedFile.files.first;
      _idController.text = file.name;
    }
  }

  FadeInLeft _buildFadeInSectionTitle({required String title}) {
    return FadeInLeft(
      from: AppConstants.fadeInHorizontalValue,
      child: SectionTitle(title: title),
    );
  }

  void _continueToPayment() {
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
    // if (_formKey.currentState!.validate()) {
    //   context.navigateTo(
    //     routeName: Routes.paymentViewRoute,
    //     arguments: BookingInfo(
    //       firstName: _firstNameController.text.trim(),
    //       surname: _surnameController.text.trim(),
    //       email: _emailController.text,
    //       phoneNumber: _phoneController.text,
    //       checkInDate: widget.bookingInfo.checkInDate,
    //       checkOutDate: widget.bookingInfo.checkOutDate,
    //       roomType: widget.bookingInfo.roomType,
    //       roomNumber: widget.bookingInfo.roomNumber,
    //       guestNumber: widget.bookingInfo.guestNumber,
    //       hotelName: widget.bookingInfo.hotelName,
    //     ),
    //   );
    //   _clearTextFields();
    // } else {
    //   setState(() {
    //     autoValidateMode = AutovalidateMode.always;
    //   });
    // }
  }

  String? _validateBlankFields(String? val) {
    if (val!.isEmpty) {
      return "Can't be blank";
    }
    return null;
  }

  void _clearTextFields() {
    _emailController.clear();
    _firstNameController.clear();
    _surnameController.clear();
    _phoneController.clear();
    _idController.clear();
    _ninCodeNameController.clear();
  }

  void _disposeControllers() {
    _firstNameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _idController.dispose();
    _ninCodeNameController.dispose();
  }
}
