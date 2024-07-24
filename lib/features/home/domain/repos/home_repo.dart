import 'package:bookly/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks();
  Future<Either<Failures, List<BookEntity>>> fetchSimilarBooks();
}
