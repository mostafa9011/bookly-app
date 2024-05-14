import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:bookly/Features/home/data/data_sources/local_data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/errors/server_failure.dart';
import '../../../domain/repos/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  HomeRemoteDateSource homeRemoteDateSource;
  HomeLocalDateSource homeLocalDateSource;
  HomeRepoImp({
    required this.homeRemoteDateSource,
    required this.homeLocalDateSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> booksList = homeLocalDateSource.fetchFeaturedBooks();
      if (booksList.isNotEmpty) {
        return Right(booksList);
      }
      booksList = await homeRemoteDateSource.fetchFeaturedBooks();

      return Right(booksList);
    } catch (e) {
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
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> booksList = homeLocalDateSource.fetchNewestBooks();
      if (booksList.isNotEmpty) {
        return Right(booksList);
      }
      booksList = await homeRemoteDateSource.fetchNewestBooks();

      return Right(booksList);
    } catch (e) {
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
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(String categort) {
    // TODO: implement fetchSimilarBooks
    throw UnimplementedError();
  }
}

/* 
class HomeRepoImp implements HomeRepo {
  final ApiService apiService;
  HomeRepoImp({
    required this.apiService,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: Constants.featuredBooksEndPiont,
      );

      List<dynamic> itemList = data['items'];
      List<BookEntity> booksList = [];

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
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> booksList = [];

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
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
    String categort,
  ) async {
    try {
      List<BookEntity> booksList = [];

      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=computer scince&Sorting=newest&Sorting=relevance',
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
*/
