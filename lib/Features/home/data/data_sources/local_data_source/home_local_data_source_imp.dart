import 'package:bookly/Features/home/data/data_sources/local_data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly/core/constants.dart';
import 'package:hive/hive.dart';

class HomeLocalDateSourceImp extends HomeLocalDateSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var fBox = Hive.box<BookEntity>(Constants.featuredBox);
    return fBox.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var nBox = Hive.box<BookEntity>(Constants.newestBox);
    return nBox.values.toList();
  }
}
