import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
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
      emit(
        value.fold(
          (l) => SignInErrorState(error: l.errorMessage.toString()),
          (r) => SignInSuccessState(uId: r.id.toString()),
        ),
      );
    });
  }

  void signInWithGoogle() {
    emit(SignInWithGoogleLoadingState());

    loginWithGoogleUseCase(NoParams()).then((value) {
      emit(SignInSuccessState(
        uId: value.foldRight('loginWithGoogle', (r, previous) => r.user!.uid),
      ));
    }).catchError((error) {
      emit(SignInWithGoogleErrorState(error: error.toString()));
    });
  }

  void switchPassVisibility() {
    passVisibility = !passVisibility;
    emit(SwitchPassVisibleState(passVisibility: passVisibility));
  }
}
