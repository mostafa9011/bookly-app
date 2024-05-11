import 'dart:async';
import 'package:bookly/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:either_dart/either.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(String categort);
}
