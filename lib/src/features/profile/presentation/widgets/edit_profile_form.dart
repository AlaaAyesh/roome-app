import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/auth_helper.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/core/widgets/custom_snack_bar.dart';
import 'package:roome/src/core/widgets/main_button.dart';
import 'package:roome/src/features/profile/presentation/cubits/edit_profile/edit_profile_cubit.dart';
import 'package:roome/src/features/profile/presentation/widgets/edit_profile_text_field.dart';
import 'package:roome/src/features/profile/presentation/widgets/info_container.dart';
import 'package:roome/src/features/profile/presentation/widgets/profile_section_title.dart';
import 'package:roome/src/features/profile/domain/entities/update_user_params.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  late final GlobalKey<FormState> _formKey;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _initFormAttributes() {
    _formKey = GlobalKey<FormState>();
  }

  @override
  void initState() {
    _assignValuesToControllers();
    _initFormAttributes();
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
              SizedBox(height: 10.h),
              FadeInRight(
                from: AppConstants.fadeInHorizontalValue,
                child: InfoContainer(
                  child: Column(
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
                            return "Can't be empty";
                          }
                          return null;
                        },
                      ),
                      const BottomSpacer(),
                      EditProfileTextField(
                        title: 'Username',
                        controller: _usernameController,
                        hint: 'Your username',
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.text,
                        validating: (String? val) {
                          if (val!.isEmpty) {
                            return "Can't be empty";
                          }
                          return null;
                        },
                      ),
                      const BottomSpacer(),
                      BlocBuilder<EditProfileCubit, EditProfileState>(
                        builder: (context, state) {
                          EditProfileCubit cubit =
                              BlocProvider.of<EditProfileCubit>(context);
                          return EditProfileTextField(
                            title: 'Password',
                            controller: _passwordController,
                            hint: 'Your password',
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.visiblePassword,
                            obscure: cubit.passVisible,
                            validating: (String? val) {
                              if (val!.isEmpty) {
                                return "Can't be empty";
                              } else if (val.length < 8) {
                                return 'Week password';
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                              icon: Icon(cubit.passVisible
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded),
                              onPressed: () => cubit.switchPassVisibility(),
                            ),
                          );
                        },
                      ),
                      const BottomSpacer(),
                      EditProfileTextField(
                        title: 'Occupation',
                        controller: _occupationController,
                        hint: 'Your occupation',
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.text,
                        validating: (String? val) {
                          if (val!.isEmpty) {
                            return "Can't be empty";
                          }
                          return null;
                        },
                      ),
                      const BottomSpacer(),
                      EditProfileTextField(
                        title: 'Nationality',
                        controller: _nationalityController,
                        hint: 'Your nationality',
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        validating: (String? val) {
                          if (val!.isEmpty) {
                            return "Can't be empty";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              FadeInRight(
                from: AppConstants.fadeInHorizontalValue,
                child: ProfileSectionTitle(
                  hasAnimation: false,
                  title: 'Contact Info',
                  themeState: themeState,
                ),
              ),
              SizedBox(height: 10.h),
              FadeInRight(
                from: AppConstants.fadeInHorizontalValue,
                child: InfoContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      EditProfileTextField(
                        title: 'Phone number',
                        controller: _phoneNumberController,
                        hint: 'Your phone number',
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.phone,
                        validating: (String? val) {
                          if (val!.isEmpty) {
                            return "Can't be empty";
                          }
                          return null;
                        },
                      ),
                      const BottomSpacer(),
                      EditProfileTextField(
                        title: 'Email',
                        controller: _emailController,
                        hint: 'Your email',
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.emailAddress,
                        validating: (String? val) {
                          if (val!.isEmpty) {
                            return "Can't be empty";
                          } else if (!val.contains('@')) {
                            return "Incorrect Email";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 44),
              BlocConsumer<EditProfileCubit, EditProfileState>(
                listener: (context, state) {
                  _controlUpdateUserStates(state, context);
                },
                builder: (context, state) => FadeInLeft(
                  from: AppConstants.fadeInHorizontalValue,
                  child: MainButton(
                    onPressed: () {
                      BlocProvider.of<EditProfileCubit>(context).profileImage ==
                              null
                          ? _validateAndUpdate(context)
                          : _validateAndUpdateUserWithProfileImage(context);
                    },
                    child: state is UpdateUserLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Save Edits',
                            style: AppTextStyles.onBoardingHeadingTextStyle
                                .copyWith(
                              color: Colors.white,
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
      AuthHelper.keyboardUnfocus(context);
      _updateUser(context);
    }
  }

  void _validateAndUpdateUserWithProfileImage(context) {
    if (_formKey.currentState!.validate()) {
      AuthHelper.keyboardUnfocus(context);
      _updateUserAndProfileImage(context);
    }
  }

  void _updateUser(BuildContext context) {
    BlocProvider.of<EditProfileCubit>(context).updateUser(
      context: context,
      updateUserParams: UpdateUserParams(
        userId: Helper.uId,
        firstName: _nameController.text.split(' ').first.trim(),
        lastName: _nameController.text.split(' ').last.trim(),
        username: _usernameController.text.trim(),
        occupation: _occupationController.text.trim(),
        nationality: _nationalityController.text.trim(),
        phoneNumber: _phoneNumberController.text,
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ),
    );
  }

  void _updateUserAndProfileImage(context) {
    BlocProvider.of<EditProfileCubit>(context).uploadProfileImage(
      context: context,
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

  void _controlUpdateUserStates(EditProfileState state, BuildContext context) {
    if (state is UpdateUserSuccessState) {
      CustomSnackBar.show(
        context: context,
        message: 'User updated successfully',
        state: CustomSnackBarState.success,
      );
    }

    if (state is UpdateUserErrorState) {
      CustomSnackBar.show(
        context: context,
        message: state.error,
        state: CustomSnackBarState.error,
      );
    }
  }

  void _assignValuesToControllers() {
    _nameController.text =
        '${Helper.currentUser!.firstName} ${Helper.currentUser!.lastName}';
    _usernameController.text = Helper.currentUser!.username!;
    _occupationController.text = Helper.currentUser!.occupation!;
    _nationalityController.text = Helper.currentUser!.nationality!;
    _phoneNumberController.text = Helper.currentUser!.phoneNumber!;
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
