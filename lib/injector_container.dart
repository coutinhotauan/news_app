import 'package:get_it/get_it.dart';
import 'package:news_app/features/search_news/data/datasources/news_search_datasource.dart';
import 'package:news_app/features/search_news/data/repositories/news_search_repository_impl.dart';
import 'package:news_app/features/search_news/domain/usecases/get_news_search.dart';
import 'package:news_app/features/search_news/presentation/bloc/news_search_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async{
  //cubit
  sl.registerFactory(
    () => NewsSearchCubit(
      getNewsSearch: sl(),
    ),
  );

  //usecase
  sl.registerSingleton(
    () => GetNewsSearch(
      repository: sl(),
    ),
  );

  //repository
  sl.registerSingleton(
    () => NewsSearchRepositoryImpl(
      datasource: sl(),
    ),
  );

  //datasource
  sl.registerSingleton(
    () => NewsSearchDataSourceImpl(
      client: sl(),
    ),
  );

  //client http
  sl.registerSingleton(
    () => http.Client(),
  );
}
