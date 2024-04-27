import 'package:bookly/core/errors/failure.dart';

class ServerFailure extends Failure {
  ServerFailure({
    required super.message,
    required super.statusCode,
  });
}
