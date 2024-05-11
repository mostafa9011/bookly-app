import 'package:bookly/Features/home/data/data_sources/local_data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entitiy.dart';

class HomeLocalDateSourceImp extends HomeLocalDateSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
