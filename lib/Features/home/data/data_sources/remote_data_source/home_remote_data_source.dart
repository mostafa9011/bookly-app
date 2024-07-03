import '../../../domain/entities/book_entitiy.dart';

abstract class HomeRemoteDateSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchSimilarBooks();
}
