import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/entities/no_params.dart';
import 'package:roome/src/core/models/user_model.dart';
import 'package:roome/src/features/auth/domain/entities/login/login_parameters.dart';
import 'package:roome/src/features/auth/domain/usecases/login/user_login_usecase.dart';
import 'package:roome/src/features/auth/domain/usecases/login/login_with_google_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserLoginUseCase loginUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;

  LoginCubit({
    required this.loginUseCase,
    required this.loginWithGoogleUseCase,
  }) : super(LoginInitial());

  bool loginPassVisibility = true;

  void userSignIn({
    required String usernameOrEmail,
    required String password,
  }) {
    emit(SignInLoadingState());

    loginUseCase(LoginParameters(
      usernameOrEmail: usernameOrEmail,
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
    loginPassVisibility = !loginPassVisibility;
    emit(SwitchLoginPassVisibleState(passVisibility: loginPassVisibility));
  }

  bool remembered = false;

  void switchRemembered() {
    remembered = !remembered;

    emit(SwitchRememberMeState(remembered: remembered));
  }
}
