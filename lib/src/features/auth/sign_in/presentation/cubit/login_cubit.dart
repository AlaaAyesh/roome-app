import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:roome/src/features/auth/sign_in/domain/entities/login_params.dart';
import 'package:roome/src/features/auth/sign_in/domain/usecases/login_usecase.dart';
import 'package:roome/src/features/auth/sign_in/domain/usecases/login_with_google_usecase.dart';

import '../../../../../core/entities/no_params.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;

  LoginCubit({
    required this.loginUseCase,
    required this.loginWithGoogleUseCase,
  }) : super(LoginInitial());

  bool passVisibility = true;

  void userSignIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());

    // Either<Failure, UserCredential> response =
    //     await loginUseCase(LoginParameters(
    //   email: email,
    //   password: password,
    // ));

    await loginUseCase
        .call(LoginParameters(email: email, password: password))
        .then((value) {
      emit(SignInSuccessState(
        uId: value.foldRight('login', (r, _) => r.user!.uid),
      ));
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        emit(SignInErrorState(error: error.code.toString()));
      }
    });

    // emit(
    //   response.fold(
    //     (error) {
    //       return SignInErrorState(error: error.code.toString());
    //     },
    //     (credential) => SignInSuccessState(uId: credential.user!.uid),
    //   ),
    // );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInWithGoogleLoadingState());

    await loginWithGoogleUseCase(NoParams()).then((value) {
      emit(SignInSuccessState(
        uId: value.foldRight('loginWithGoogle', (r, previous) => r.user!.uid),
      ));
    }).catchError((error) {
      emit(SignInWithGoogleErrorState(error: error.toString()));
    });

    // emit(
    //   response.fold(
    //     (error) => SignInWithGoogleErrorState(error: error.toString()),
    //     (credential) => SignInWithGoogleSuccessState(uId: credential.user!.uid),
    //   ),
    // );
  }

  void switchPassVisibility() {
    passVisibility = !passVisibility;
    emit(SwitchPassVisibleState(passVisibility: passVisibility));
  }
}
