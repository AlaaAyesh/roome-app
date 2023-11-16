import 'package:animate_do/animate_do.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/core/widgets/custom_action_button.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _ninCodeNameController = TextEditingController();

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
          Row(
            children: <Widget>[
              Expanded(child: _buildFadeInSectionTitle(title: 'First Name')),
              const SizedBox(width: 35),
              Expanded(child: _buildFadeInSectionTitle(title: 'Surname')),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: <Widget>[
              Expanded(
                child: BookingTwoTextField(
                  controller: _firstNameController,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  validating: (String? val) {
                    return _validateBlankFields(val);
                  },
                ),
              ),
              const SizedBox(width: 35),
              Expanded(
                child: BookingTwoTextField(
                  controller: _surnameController,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  validating: (String? val) {
                    return _validateBlankFields(val);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 26),
          _buildFadeInSectionTitle(title: 'Email'),
          const SizedBox(height: 14),
          BookingTwoTextField(
            controller: _emailController,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.emailAddress,
            width: double.infinity,
            validating: (String? val) {
              if (val!.isEmpty) {
                return "Can't be blank!";
              } else if (!val.contains('@')) {
                return "Incorrect email";
              }

              return null;
            },
          ),
          const SizedBox(height: 26),
          _buildFadeInSectionTitle(title: 'Phone'),
          const SizedBox(height: 14),
          BookingTwoTextField(
            controller: _phoneController,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.phone,
            width: double.infinity,
            validating: (String? val) {
              return _validateBlankFields(val);
            },
          ),
          const SizedBox(height: 21),
          _buildFadeInSectionTitle(title: 'Kindly upload any valid ID'),
          const SizedBox(height: 17),
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
              const SizedBox(width: 12),
              const Icon(
                Icons.attach_file,
                color: AppColors.darkGrey,
                size: 22,
              ),
            ],
          ),
          const SizedBox(height: 13),
          BlocBuilder<ThemesCubit, ThemeData>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => _pickFile(),
                child: BookingTwoTextField(
                  enabled: false,
                  hint: 'Click Here to Upload',
                  hintStyle: AppTextStyles.textStyle14Medium.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  controller: _idController,
                  textCapitalization: TextCapitalization.none,
                  keyboardType: TextInputType.text,
                  validating: (String? val) {
                    return _validateBlankFields(val);
                  },
                  border: Border.all(color: AppColors.primaryColor),
                  width: double.infinity,
                  backgroundColor: state.brightness == Brightness.light
                      ? Colors.white
                      : Colors.black,
                  prefixIcon: const Icon(
                    Icons.cloud_upload,
                    color: AppColors.primaryColor,
                    size: 24,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 19),
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
          const SizedBox(height: 8),
          _buildFadeInSectionTitle(title: 'Input your NIN Code'),
          const SizedBox(height: 14),
          BookingTwoTextField(
            controller: _ninCodeNameController,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            width: double.infinity,
            validating: (String? val) {
              return _validateBlankFields(val);
            },
          ),
          const SizedBox(height: 35),
          FadeInUp(
            from: AppConstants.fadeInUpValue,
            child: CustomActionButton(
              buttonText: 'Continue',
              onPressed: () => _continueToPayment(),
              textStyle: AppTextStyles.textStyle15.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              backgroundColor: AppColors.primaryColor,
            ),
          ),
          const BottomSpacer(),
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
      _clearTextFields();
    }
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
