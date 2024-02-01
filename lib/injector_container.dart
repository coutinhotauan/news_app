import 'package:get_it/get_it.dart';
import 'package:news_app/features/search_news/data/datasources/news_search_datasource.dart';
import 'package:news_app/features/search_news/data/repositories/news_search_repository_impl.dart';
import 'package:news_app/features/search_news/domain/repository/news_search_repository.dart';
import 'package:news_app/features/search_news/domain/usecases/get_news_search.dart';
import 'package:news_app/features/search_news/presentation/bloc/news_search_cubit.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

GetIt sl = GetIt.instance;

init() {
  //client http (c/ logs)
  sl.registerSingleton(
    HttpWithMiddleware.build(
      middlewares: [
        HttpLogger(logLevel: LogLevel.BODY),
      ],
    ),
  );

  //datasource
  sl.registerSingleton<NewsSearchDataSource>(
    NewsSearchDataSourceImpl(
      client: sl<HttpWithMiddleware>(),
    ),
  );

  //repository
  sl.registerSingleton<NewsSearchRepository>(
    NewsSearchRepositoryImpl(
      datasource: sl<NewsSearchDataSource>(),
    ),
  );

  //usecase
  sl.registerSingleton<GetNewsSearch>(
    GetNewsSearch(
      repository: sl<NewsSearchRepository>(),
    ),
  );

  //cubit
  sl.registerFactory<NewsSearchCubit>(
    () => NewsSearchCubit(
      getNewsSearch: sl<GetNewsSearch>(),
    ),
  );
}
