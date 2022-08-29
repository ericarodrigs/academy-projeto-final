class Failure {
  String? message;
  StackTrace? stackTrace;
  Object? object;

  Failure({
    this.message,
    this.stackTrace,
    this.object,
  });
}
