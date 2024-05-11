part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchFailure extends SearchState {
  final String errorMessage;

  const SearchFailure(this.errorMessage);
}

class SearchSuccess extends SearchState {
  final List<BookModel2> books;

  const SearchSuccess(this.books);
}
