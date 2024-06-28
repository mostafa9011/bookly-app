import 'package:bookly/Features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_loading_widget.dart';
import 'package:bookly/core/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/presentation/views/widgets/newest_books_item_list_view.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  // bookModel: state.books[index],
                  bookEntity: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(
            text: state.errorMessage,
          );
        } else if (state is SearchInitial) {
          return const Center(
            child: Text(
              'Tap to Search',
              style: Styles.textStyle30,
            ),
          );
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
