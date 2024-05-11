import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:either_dart/either.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks({
    required String title,
  });
}
