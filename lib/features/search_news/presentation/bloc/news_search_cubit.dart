import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/search_news/domain/usecases/get_news_search.dart';
import 'package:news_app/features/search_news/presentation/bloc/news_search_state.dart';

class NewsSearchCubit extends Cubit<NewsSearchState>{
  final GetNewsSearch getNewsSearch;

  NewsSearchCubit({required this.getNewsSearch}) : super(Empty());

  void getNews(String keyword) async{
    try{
      emit(Loading());
      final result = await getNewsSearch.call(Params(keyword: keyword));
      emit(Loaded(news: (result as Right).value));
    } catch(e){
      emit(Error(message: "error"));
    }
  }
}