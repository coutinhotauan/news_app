import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';
import 'package:news_app/features/search_news/domain/entities/news_search.dart';

class GetHeadlines extends UseCase<NewsSearch, NoParams>{
  final HomeRepository repository;

  GetHeadlines({required this.repository});

  @override
  Future<Either<Failure, NewsSearch>> call(NoParams params) async{
    return await repository.getHeadlines();
  }
}