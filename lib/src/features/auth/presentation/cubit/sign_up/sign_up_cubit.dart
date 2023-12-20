import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/entities/no_params.dart';
import 'package:roome/src/core/models/user/user.dart';
import 'package:roome/src/features/auth/domain/entities/sign_up/sign_up_parameters.dart';
import 'package:roome/src/features/auth/domain/usecases/sign_up/user_sign_up_usecase.dart';
import 'package:roome/src/features/auth/domain/usecases/sign_up/sign_up_with_google_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final UserSignUpUseCase signUpUseCase;

  final SignUpWithGoogleUseCase signUpWithGoogleUseCase;

  SignUpCubit({
    required this.signUpUseCase,
    required this.signUpWithGoogleUseCase,
  }) : super(const SignUpInitial());

  bool signUpPassVisibility = true;

  void userSignUp({
    required SignUpParameters signUpParameters,
  }) {
    emit(const SignUpLoadingState());

    signUpUseCase(signUpParameters).then(
      (value) {
        value.fold(
          (failure) =>
              emit(SignUpErrorState(error: failure.failureMsg.toString())),
          (user) {
            emit(
              SignUpSuccessState(
                uId: user.id!,
                userModel: user,
              ),
            );
          },
        );
      },
    );
  }

  void signUpWithGoogle() {
    emit(const SignUpWithGoogleLoadingState());

    signUpWithGoogleUseCase(const NoParams()).then((value) {
      value.fold(
        (failure) => emit(
          SignUpWithGoogleErrorState(
            error: failure.failureMsg.toString(),
          ),
        ),
        (user) => emit(SignUpWithGoogleSuccessState(uId: user.user!.uid)),
      );
    });
  }

  void switchPassVisibility() {
    signUpPassVisibility = !signUpPassVisibility;
    emit(
      SwitchSignUpPassVisibleState(signUpPassVisibility: signUpPassVisibility),
    );
  }
}
