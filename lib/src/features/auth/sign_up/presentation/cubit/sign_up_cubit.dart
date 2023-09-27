import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:roome/src/features/auth/sign_up/domain/entities/sign_up_parameters.dart';

import 'package:roome/src/features/auth/sign_up/domain/usecases/sign_up_usecase.dart';
import 'package:roome/src/features/auth/sign_up/domain/usecases/sign_up_with_google_usecase.dart';

import '../../../../../core/entities/no_params.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;

  final SignUpWithGoogleUseCase signUpWithGoogleUseCase;

  SignUpCubit({
    required this.signUpUseCase,
    required this.signUpWithGoogleUseCase,
  }) : super(SignUpInitial());

  bool passVisibility = true;

  void userSignUp({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
  }) {
    emit(SignUpLoadingState());

    signUpUseCase(SignUpParameters(
      firstName: firstName,
      lastName: lastName,
      username: username,
      email: email,
      password: password,
    )).then(
      (value) {
        emit(value.fold(
          (failure) => SignUpErrorState(error: failure.errorMessage.toString()),
          (user) => SignUpSuccessState(uId: user.id.toString()),
        ));
      },
    );
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
