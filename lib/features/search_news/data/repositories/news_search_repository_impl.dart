import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/exception.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/features/search_news/data/datasources/news_search_datasource.dart';
import 'package:news_app/features/search_news/domain/entities/news_search.dart';
import 'package:news_app/features/search_news/domain/repository/news_search_repository.dart';

class NewsSearchRepositoryImpl extends NewsSearchRepository {
  final NewsSearchDataSource datasource;

  NewsSearchRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, NewsSearch>> getNews(String keyword) async {
    try {
      final news = await datasource.getNews(keyword);
      return Right(news);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
