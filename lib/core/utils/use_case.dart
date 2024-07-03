import 'package:bookly/core/errors/failure.dart';
import 'package:either_dart/either.dart';

abstract class UseCase<Type, Parms> {
  Future<Either<Failure, Type>> execute({Parms parms});
}
