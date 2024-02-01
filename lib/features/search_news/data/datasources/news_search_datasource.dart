import 'dart:convert';

import 'package:news_app/core/error/exception.dart';
import 'package:news_app/features/search_news/domain/entities/news_search.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class NewsSearchDataSource {
  Future<NewsSearch> getNews(String keyword);
}

class NewsSearchDataSourceImpl implements NewsSearchDataSource {
  final http.Client client;

  NewsSearchDataSourceImpl({required this.client});

  @override
  Future<NewsSearch> getNews(String keyword) async{
    Uri url = Uri.parse("https://newsapi.org/v2/everything");

    Map<String, String> parameters = {
      "apiKey": "02bb9290874d43f689a65e2afbcb8f9c",
      "q": keyword,
    };

    final response = await client.get(url, headers: parameters);

    if (response.statusCode == 200){
      return NewsSearch.fromJson(json.decode(response.body));
    }else{
      throw ServerException();
    }
  }
}
