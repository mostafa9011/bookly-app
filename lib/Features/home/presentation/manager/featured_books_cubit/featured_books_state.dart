part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String errormessage;

  const FeaturedBooksFailure(this.errormessage);
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> booksList;

  const FeaturedBooksSuccess(this.booksList);
}
