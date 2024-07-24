import 'package:bookly/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/error/failures.dart';
import 'package:bookly/core/utils/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> execute({void parms}) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
