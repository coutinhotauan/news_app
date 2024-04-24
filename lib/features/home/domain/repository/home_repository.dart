import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/features/search_news/domain/entities/news_search.dart';

abstract class HomeRepository{
  Future<Either<Failure, NewsSearch>> getHeadlines();
}