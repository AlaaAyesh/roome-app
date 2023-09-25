import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roome/src/core/entities/user_entity.dart';
import 'package:roome/src/features/auth/sign_up/domain/usecases/create_uer_usecase.dart';
import 'package:roome/src/features/auth/sign_up/domain/usecases/sign_up_usecase.dart';
import 'package:roome/src/features/auth/sign_up/domain/usecases/sign_up_with_google_usecase.dart';

import '../../../../../core/entities/no_params.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;
  final CreateUserUseCase createUserUseCase;
  final SignUpWithGoogleUseCase signUpWithGoogleUseCase;

  SignUpCubit({
    required this.signUpUseCase,
    required this.createUserUseCase,
    required this.signUpWithGoogleUseCase,
  }) : super(SignUpInitial());

  bool passVisibility = true;

  void userSignUp({
    required String username,
    required String email,
    required String password,
  }) {
    emit(SignUpLoadingState());

    signUpUseCase(
      UserEntity(
        name: username,
        email: email,
        password: password,
      ),
    ).then((value) {
      firestoreCreateUser(
        name: username,
        email: email,
        uId: value.foldRight('sign up', (r, _) => r.user!.uid),
      );
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        emit(SignUpErrorState(error: error.code.toString()));
      }
    });
  }

  void firestoreCreateUser({
    required String name,
    required String email,
    required String uId,
  }) {
    createUserUseCase(
      UserEntity(
        name: name,
        email: email,
        uId: uId,
      ),
    ).then((value) {
      emit(CreateUserSuccessState());
      emit(SignUpSuccessState(uId: uId));
    }).catchError((error) {
      debugPrint("ERROR: ${error.toString()}");
      emit(CreateUserErrorState(error: error.toString()));
    });
  }

  void signUpWithGoogle() {
    emit(SignUpWithGoogleLoadingState());

    signUpWithGoogleUseCase(NoParams()).then((value) {
      emit(SignUpWithGoogleSuccessState(
        uId: value.foldRight('loginWithGoogle', (r, previous) => r.user!.uid),
      ));
    }).catchError((error) {
      emit(SignUpWithGoogleErrorState(error: error.toString()));
    });
  }

  void switchPassVisibility() {
    passVisibility = !passVisibility;
    emit(SwitchPassVisibleState(passVisibility: passVisibility));
  }
}
