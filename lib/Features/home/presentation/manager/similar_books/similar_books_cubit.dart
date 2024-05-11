import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/home_repo/home_repo.dart';
part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks(String category) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category);
    result.fold((failure) {
      emit(
        SimilarBooksFailure(failure.message),
      );
    }, (books) {
      // emit(
      //   SimilarBooksSuccess(books),
      // );
    });
  }
}
