abstract class Failure {
  final String? errorMessage;
  const Failure({this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({String? errorMessage}) : super(errorMessage: errorMessage);
}
