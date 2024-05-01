import 'package:bookly/core/constants.dart';
import 'package:bookly/core/errors/server_failure.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;
  HomeRepoImp({
    required this.apiService,
  });

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      List<BookModel> booksList = [];

      var data = await apiService.get(
        endPoint: Constants.featuredBooksEndPiont,
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      List<BookModel> booksList = [];

      var data = await apiService.get(
        endPoint: Constants.newestBooksEndPiont,
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
    String categort,
  ) async {
    try {
      List<BookModel> booksList = [];

      var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=computer scince&Sorting=newest&Sorting=relevance',
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
