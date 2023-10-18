import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_navigator.dart';

import '../../../../core/helpers/helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../../core/widgets/loading_dialog.dart';
import '../../../../core/widgets/visibility_icon_button.dart';
import '../../../roome/presentation/cubit/roome_cubit.dart';
import 'edit_profile_text_field.dart';
import 'info_container.dart';
import 'profile_section_title.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPersonalValidateError = false;
  bool _isContactValidateError = false;

  @override
  void initState() {
    _assignValuesToControllers();
    super.initState();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, themeState) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeInRight(
                from: AppConstants.fadeInHorizontalValue,
                child: ProfileSectionTitle(
                  hasAnimation: false,
                  title: 'Personal Info',
                  themeState: themeState,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              FadeInRight(
                from: AppConstants.fadeInHorizontalValue,
                child: InfoContainer(
                  isPersonalValidateError: _isPersonalValidateError,
                  height: 330,
                  personalErrorHeight: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      EditProfileTextField(
                        title: 'Name',
                        controller: _nameController,
                        hint: 'Your name',
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.name,
                        validating: (String? val) {
                          if (val!.isEmpty) {
                            setState(() {
                              _isPersonalValidateError = true;
                            });
                            return "Can't be empty";
                          }
                          return null;
                        },
                      ),
                      EditProfileTextField(
                        title: 'Username',
                        controller: _usernameController,
                        hint: 'Your username',
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.text,
                        validating: (String? val) {
                          if (val!.isEmpty) {
                            setState(() {
                              _isPersonalValidateError = true;
                            });
                            return "Can't be empty";
                          }
                          return null;
                        },
                      ),
                      BlocBuilder<RoomeCubit, RoomeState>(
                        builder: (context, state) {
                          RoomeCubit cubit = RoomeCubit.getObject(context);
                          return EditProfileTextField(
                            title: 'Password',
                            controller: _passwordController,
                            hint: 'Your password',
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.visiblePassword,
                            obscure: cubit.passVisible,
                            validating: (String? val) {
                              if (val!.isEmpty) {
                                setState(() {
                                  _isPersonalValidateError = true;
                                });
                                return "Can't be empty";
                              } else if (val.length < 8) {
                                setState(() {
                                  _isPersonalValidateError = true;
                                });
                                return 'Week password';
                              }
                              return null;
                            },
                            suffixIcon: VisibilityIconButton(
                              icon: cubit.passVisible
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded,
                              onPressed: () => cubit.switchPassVisibility(),
                            ),
                          );
                        },
                      ),
                      EditProfileTextField(
                        title: 'Occupation',
                        controller: _occupationController,
                        hint: 'Your occupation',
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.text,
                        validating: (String? val) {
                          if (val!.isEmpty) {
                            setState(() {
                              _isPersonalValidateError = true;
                            });
                            return "Can't be empty";
                          }
                          return null;
                        },
                      ),
                      EditProfileTextField(
                        title: 'Nationality',
                        controller: _nationalityController,
                        hint: 'Your nationality',
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        validating: (String? val) {
                          if (val!.isEmpty) {
                            setState(() {
                              _isPersonalValidateError = true;
                            });
                            return "Can't be empty";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.025),
              FadeInRight(
                from: AppConstants.fadeInHorizontalValue,
                child: ProfileSectionTitle(
                  hasAnimation: false,
                  title: 'Contact Info',
                  themeState: themeState,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              FadeInRight(
                from: AppConstants.fadeInHorizontalValue,
                child: InfoContainer(
                  isContactValidateError: _isContactValidateError,
                  height: 170,
                  contactErrorHeight: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      EditProfileTextField(
                        title: 'Phone number',
                        controller: _phoneNumberController,
                        hint: 'Your phone number',
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.phone,
                        validating: (String? val) {
                          if (val!.isEmpty) {
                            setState(() {
                              _isContactValidateError = true;
                            });
                            return "Can't be empty";
                          }
                          return null;
                        },
                      ),
                      EditProfileTextField(
                        title: 'Email',
                        controller: _emailController,
                        hint: 'Your email',
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.emailAddress,
                        validating: (String? val) {
                          if (val!.isEmpty) {
                            setState(() {
                              _isContactValidateError = true;
                            });
                            return "Can't be empty";
                          } else if (!val.contains('@')) {
                            setState(() {
                              _isContactValidateError = true;
                            });
                            return "Incorrect Email";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.044),
              BlocListener<RoomeCubit, RoomeState>(
                listener: (context, state) {
                  _controlUpdateUserStates(state, context);
                },
                child: FadeInLeft(
                  from: AppConstants.fadeInHorizontalValue,
                  child: MyCustomButton(
                    height: 50.h,
                    width: SizeConfig.screenWidth,
                    backgroundColor: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    onPressed: () => _validateAndUpdate(context),
                    hasPrefix: false,
                    child: Center(
                      child: Text(
                        'Save Edit',
                        style:
                            AppTextStyles.onBoardingHeadingTextStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _validateAndUpdate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      CustomHelper.keyboardUnfocus(context);
      _updateUser(context);
    }
  }

  void _updateUser(BuildContext context) {
    BlocProvider.of<RoomeCubit>(context).updateUser(
      firstName: _nameController.text.split(' ').first.trim(),
      lastName: _nameController.text.split(' ').last.trim(),
      username: _usernameController.text.trim(),
      occupation: _occupationController.text.trim(),
      nationality: _nationalityController.text.trim(),
      phoneNumber: _phoneNumberController.text,
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
  }

  void _forceConditionsToFalse() {
    if (_isContactValidateError) {
      setState(() {
        _isContactValidateError = false;
      });
    } else if (_isPersonalValidateError) {
      setState(() {
        _isPersonalValidateError = false;
      });
    }
  }

  void _controlUpdateUserStates(RoomeState state, BuildContext context) {
    if (state is UpdateUserLoadingState) {
      showAdaptiveDialog<Widget>(
        context: context,
        builder: (context) => const LoadingDialog(),
      );

      _forceConditionsToFalse();
    }

    if (state is UpdateUserSuccessState) {
      context.getBack();
      CustomSnackBar.show(
        context: context,
        message: 'User updated successfully',
        title: 'Success',
        backgroundColor: Colors.green,
      );
    }

    if (state is UpdateUserErrorState) {
      context.getBack();
      CustomSnackBar.show(
        context: context,
        message: state.error,
        title: 'Warning',
      );
    }
  }

  void _assignValuesToControllers() {
    _nameController.text =
        '${Helper.currentUser!.firstName} ${Helper.currentUser!.lastName}';
    _usernameController.text = Helper.currentUser!.username!;
    _occupationController.text = Helper.currentUser!.occupation ?? 'Unknown';
    _nationalityController.text = Helper.currentUser!.nationality ?? 'Unknown';
    _phoneNumberController.text = Helper.currentUser!.phoneNumber ?? 'Unknown';
    _emailController.text = Helper.currentUser!.email!;
    _passwordController.text = Helper.currentUser!.password!;
  }

  void _disposeControllers() {
    _nameController.dispose();
    _usernameController.dispose();
    _occupationController.dispose();
    _nationalityController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
