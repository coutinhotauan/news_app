import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/error/exception.dart';
import 'package:news_app/features/search_news/data/datasources/news_search_datasource.dart';
import 'package:news_app/features/search_news/domain/entities/news_search.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'news_search_datasource_test.mocks.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([http.Client])
void main() {
  late NewsSearchDataSourceImpl datasource;
  late MockClient client;

  setUp(
    () {
      client = MockClient();
      datasource = NewsSearchDataSourceImpl(client: client);
    },
  );

  const tKeyword = "keyword";

  const tUrl = "url";

  final tNewsSearch =
      NewsSearch.fromJson(json.decode(fixture("news_search.json")));

  Map<String, dynamic> parameters = {
    "apiKey": "key",
    "q": "keyword",
  };

  test(
    'should return News Search when the status code is 200',
    () async {
      when(client.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response(
          fixture("news_search.json"),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
          },
        ),
      );

      final result = await datasource.getNews(tKeyword);

      expect(result, equals(tNewsSearch));
    },
  );

  test(
    'should throw a ServerException when the response code is 404 or other',
    () async {
      when(client.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response(
          "Something went wrong",
          404,
        ),
      );
      
      final result = datasource.getNews;

      expect(() => result(tKeyword), throwsA(const TypeMatcher<ServerException>()));
    },
  );
}
