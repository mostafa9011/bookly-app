class BookEntity {
  final String bookId;
  final String image;
  final String title;
  final String autherName;
  final num price;
  final num rating;

  const BookEntity({
    required this.image,
    required this.title,
    required this.autherName,
    required this.price,
    required this.rating,
    required this.bookId,
  });
}
