abstract class Failure {
  final String message;

  Failure(this.message);
}

class SomeSpecificFailure extends Failure {
  SomeSpecificFailure(String message) : super(message);
}
