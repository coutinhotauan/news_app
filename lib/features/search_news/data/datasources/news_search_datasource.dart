import 'dart:convert';
import 'package:news_app/core/error/exception.dart';
import 'package:news_app/features/search_news/data/models/news_search_model.dart';
import 'package:news_app/features/search_news/domain/entities/news_search.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

abstract class NewsSearchDataSource {
  Future<NewsSearchModel> getNews(String keyword);
}

class NewsSearchDataSourceImpl implements NewsSearchDataSource {
  final HttpWithMiddleware client;

  NewsSearchDataSourceImpl({required this.client});

  @override
  Future<NewsSearchModel> getNews(String keyword) async{
    Uri url = Uri.parse("https://newsapi.org/v2/everything?q=${keyword}&apiKey=02bb9290874d43f689a65e2afbcb8f9c");

    //parametros foram incluidos na url para funcionar
    // Map<String, String> parameters = {
    //   "apiKey": "02bb9290874d43f689a65e2afbcb8f9c",
    //   "q": keyword,
    // };

    final response = await client.get(url);

    if (response.statusCode == 200){
      return NewsSearchModel.fromJson(json.decode(response.body));
    }else{
      throw ServerException();
    }
  }
}
