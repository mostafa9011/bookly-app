import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/data/models/book_model/book_model.dart';
import '../../../data/repos/search_repo/search_repo.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  fetchSearchedBooks({required String title}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchedBooks(title: title);
    result.fold((fail) {
      emit(
        SearchFailure(fail.message),
      );
    }, (data) {
      if (data.isEmpty) {
        emit(SearchInitial());
      } else {
        emit(
          SearchSuccess(data),
        );
      }
    });
  }
}
