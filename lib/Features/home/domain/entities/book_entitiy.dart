import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'book_entitiy.g.dart';

@HiveType(typeId: 0)
class BookEntity extends Equatable {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String autherName;
  @HiveField(4)
  final num price;
  @HiveField(5)
  final num rating;
  @HiveField(6)
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
