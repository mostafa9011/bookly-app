import 'package:bookly/features/home/data/repositories/homerepo_implementation.dart';
import 'package:bookly/features/home/presentation/manager/get_best_seller_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/get_popular_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_iteam_listview.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/loading_book.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/service_locator/locator.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20, bottom: 10, top: 20),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const Gap(35),
                BlocProvider(
                  create: (context) =>
                      GetPopularBooksCubit(getIt.get<HomeRepoImplemetation>())
                        ..getPopularBooks(query: {'q': 'programming'}),
                  child:
                      BlocBuilder<GetPopularBooksCubit, GetPopularBooksState>(
                    builder: (context, state) {
                      var bloc = BlocProvider.of<GetPopularBooksCubit>(context);
                      if (state is GetPopularBooksLoading) {
                        return const BookLoadingEffect();
                      } else if (state is GetPopularBooksError) {
                        return Center(
                          child: Text(state.errorMassage),
                        );
                      } else {
                        return BookListView(
                          model: bloc.bookModel!,
                        );
                      }
                    },
                  ),
                ),
                const Gap(30),
                Text(
                  "newestBooks".tr(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: GoogleFonts.montserrat.toString(),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                /*CustomHeadLineText(
                  txt: "newestBooks".tr(),
                ),*/
                const Gap(20),
              ],
            ),
          ),
          SliverFillRemaining(
            child: BlocProvider(
                create: (context) =>
                    GetBestSellerBooksCubit(getIt.get<HomeRepoImplemetation>())
                      ..getBestSellerBooks(),
                child: const BookListViewItem()),
          )
        ],
      ),
    );
  }
}
