import 'package:bookly/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Parms> {
  Future<Either<Failures, Type>> execute({Parms parms});
}
