import 'package:bookly/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/use_case.dart';
import 'package:either_dart/either.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> execute({void parms}) async {
    return await homeRepo.fetchNewestBooks();
  }
}
