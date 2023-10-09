import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:roome/src/core/models/user_model.dart';
import 'package:roome/src/features/auth/sign_in/domain/entities/login_parameters.dart';

import 'package:roome/src/features/auth/sign_in/domain/usecases/login_with_google_usecase.dart';

import '../../../../../core/entities/no_params.dart';
import '../../domain/usecases/login_usecase.dart';

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
    required String username,
    required String password,
  }) {
    emit(SignInLoadingState());

    loginUseCase(LoginParameters(
      username: username,
      password: password,
    )).then((value) {
      value.fold(
        (failure) =>
            emit(SignInErrorState(error: failure.errorMessage.toString())),
        (user) {
          emit(SignInSuccessState(
            uId: user.id!,
            userModel: user,
          ));
        },
      );
    });
  }

  void signInWithGoogle() {
    emit(SignInWithGoogleLoadingState());

    loginWithGoogleUseCase(const NoParams()).then((value) {
      value.fold(
        (failure) => emit(
          SignInWithGoogleErrorState(error: failure.errorMessage.toString()),
        ),
        (user) => emit(SignInWithGoogleSuccessState(uId: user.user!.uid)),
      );
    });
  }

  void switchPassVisibility() {
    passVisibility = !passVisibility;
    emit(SwitchPassVisibleState(passVisibility: passVisibility));
  }
}
