import 'package:bookly/Features/search/data/repos/search_repo/search_repo.dart';
import 'package:bookly/Features/search/data/repos/search_repo/search_repo_imp.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../Features/home/data/data_sources/local_data_source/home_local_data_source_imp.dart';
import '../../Features/home/data/data_sources/remote_data_source/home_remote_data_source_imp.dart';
import '../../Features/home/data/repos/home_repo/home_repo_imp.dart';

final getIt = GetIt.instance;
void setupServerLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      homeRemoteDateSource: HomeRemoteDateSourceImp(
        apiService: getIt.get<ApiService>(),
      ),
      homeLocalDateSource: HomeLocalDateSourceImp(),
    ),
  );
  getIt.registerSingleton<SearchRepo>(
    SearchRepoImp(
      getIt.get<ApiService>(),
    ),
  );
}
