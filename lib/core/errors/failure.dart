// core/failures.dart
class Failure {
  final String message;

  Failure(this.message);
}

// core/failures.dart
class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class ValidationFailure extends Failure {
  ValidationFailure(super.message);
}
