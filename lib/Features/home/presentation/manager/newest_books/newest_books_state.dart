part of 'newest_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksFailure extends NewestBooksState {
  final String errormessage;

  const NewestBooksFailure(this.errormessage);
}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> booksList;

  const NewestBooksSuccess(this.booksList);
}
