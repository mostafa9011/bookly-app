import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/search/data/repos/search_repo/search_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../../../../../core/errors/server_failure.dart';

class SearchRepoImp implements SearchRepo {
  final ApiService apiService;

  SearchRepoImp(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String title}) async {
    try {
      List<BookModel> booksList = [];

      var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=subject:$title',
      );

      List<dynamic> itemList = data['items'];
      for (var element in itemList) {
        booksList.add(
          BookModel.fromJson(element),
        );
      }
      return Right(booksList);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioException(e),
        );
      }
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
