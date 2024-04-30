import 'package:bookly/Features/home/data/repos/home_repo/home_repo_imp.dart';
import 'package:bookly/Features/search/data/repos/search_repo/search_repo.dart';
import 'package:bookly/Features/search/data/repos/search_repo/search_repo_imp.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServerLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      apiService: getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<SearchRepo>(
    SearchRepoImp(
      getIt.get<ApiService>(),
    ),
  );
}
