import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/exception.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/features/home/data/datasource/home_datasource.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';
import 'package:news_app/features/search_news/domain/entities/news_search.dart';

class HomeRepositoryImpl extends HomeRepository{
  final HomeDatasource datasource;

  HomeRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, NewsSearch>> getHeadlines() async{
    try{
      final headlines = await datasource.getHeadlines();
      return Right(headlines);
    }on ServerException {
      return Left(ServerFailure());
    }
  }
}