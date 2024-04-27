// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly/core/constants.dart';
import 'package:bookly/core/errors/server_failure.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
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
  Future<Either<Failure, List<BookModel>>> fetchBestSalureBooks() {
    // TODO: implement fetchBestSalureBooks
    throw UnimplementedError();
  }
}
