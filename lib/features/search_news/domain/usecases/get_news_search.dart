import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/search_news/domain/entities/news_search.dart';
import 'package:news_app/features/search_news/domain/repository/news_search_repository.dart';

class GetNewsSearch extends UseCase<NewsSearch, Params>{
   final NewsSearchRepository repository;
   GetNewsSearch(this.repository);

   @override
    Future<Either<Failure, NewsSearch>> call(Params params) async{
    return await repository.getNews(params.keyword);
   }
}

class Params extends Equatable{
  final String keyword;

  const Params({required this.keyword});
  
  @override
  List<Object?> get props => [keyword];
}