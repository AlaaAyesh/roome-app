import '/src/core/errors/failure.dart';

class Bug extends Failure {
  Bug({String? errorMessage}) : super(errorMessage: errorMessage);
}
