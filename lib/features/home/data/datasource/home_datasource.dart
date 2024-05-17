import 'dart:convert';

import 'package:news_app/core/error/exception.dart';
import 'package:news_app/features/search_news/data/models/news_search_model.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

abstract class HomeDatasource {
  Future<NewsSearchModel> getHeadlines();
}

class HomeDatasourceImpl extends HomeDatasource {
  final HttpWithMiddleware client;

  HomeDatasourceImpl({required this.client});

  @override
  Future<NewsSearchModel> getHeadlines() async {
    Uri url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&apiKey=02bb9290874d43f689a65e2afbcb8f9c");

    //parametros foram incluidos na url para funcionar
    // Map<String, String> parameters = {
    //   "apiKey": "02bb9290874d43f689a65e2afbcb8f9c",
    //   "q": keyword,
    // };

    final response = await client.get(url);

    if (response.statusCode == 200) {
      return NewsSearchModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
