import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(
    this.fetchNewestBooksUseCase,
  ) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.execute();
    result.fold((failure) {
      emit(
        NewestBooksFailure(failure.message),
      );
    }, (books) {
      emit(
        NewestBooksSuccess(books),
      );
    });
  }
}
