import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String bookId;
  final String image;
  final String title;
  final String autherName;
  final num price;
  final num rating;
  final String reviewLink;

  const BookEntity({
    required this.image,
    required this.title,
    required this.autherName,
    required this.price,
    required this.rating,
    required this.bookId,
    required this.reviewLink,
  });

  @override
  List<Object?> get props {
    return [
      bookId,
      image,
      title,
      autherName,
      price,
      rating,
      reviewLink,
    ];
  }
}
