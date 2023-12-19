import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/entities/no_params.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/features/profile/domain/usecases/sign_out_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final SignOutUseCase signOutUseCase;

  ProfileCubit({
    required this.signOutUseCase,
  }) : super(const ProfileInitial());

  void signOut() {
    signOutUseCase(const NoParams()).then((value) {
      value.fold(
        (failure) =>
            emit(SignOutErrorState(error: failure.errorMessage.toString())),
        (success) => emit(SignOutSuccessState(uId: Helper.uId)),
      );
    });
  }
}
