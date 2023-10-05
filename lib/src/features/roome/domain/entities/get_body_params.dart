import 'package:equatable/equatable.dart';

import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class GetBodyParams extends Equatable {
  final RoomeState roomeState;
  final RoomeCubit roomCubit;

  const GetBodyParams({
    required this.roomeState,
    required this.roomCubit,
  });

  @override
  List<Object?> get props => [roomeState, roomCubit];
}
