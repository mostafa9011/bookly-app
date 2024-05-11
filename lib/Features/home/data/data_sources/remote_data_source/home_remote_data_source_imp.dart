import 'package:bookly/Features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:hive/hive.dart';

import '../../../../../core/constants.dart';
import '../../models/book_model/book_model.dart';

class HomeRemoteDateSourceImpe extends HomeRemoteDateSource {
  ApiService apiService;
  HomeRemoteDateSourceImpe({
    required this.apiService,
  });
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
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
    var fBox = Hive.box<BookEntity>(Constants.featuredBox);
    fBox.addAll(booksList);
    return booksList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
      endPoint: Constants.newestBooksEndPiont,
    );

    List<dynamic> itemList = data['items'];
    List<BookEntity> booksList = [];
    for (var element in itemList) {
      booksList.add(
        BookModel.fromJson(element),
      );
    }
    var nBox = Hive.box<BookEntity>(Constants.newestBox);
    nBox.addAll(booksList);
    return booksList;
  }
}
