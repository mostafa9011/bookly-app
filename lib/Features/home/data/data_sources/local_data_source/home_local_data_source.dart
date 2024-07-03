import '../../../domain/entities/book_entitiy.dart';

abstract class HomeLocalDateSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchSimilarBooks();
}
