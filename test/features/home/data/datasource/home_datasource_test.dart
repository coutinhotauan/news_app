import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/error/exception.dart';
import 'package:news_app/features/home/data/datasource/home_datasource.dart';
import 'package:news_app/features/search_news/data/models/news_search_model.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:http/http.dart' as http;

import '../../../../fixtures/fixture_reader.dart';
import '../../../search_news/data/datasources/news_search_datasource_test.mocks.dart';

@GenerateMocks([HttpWithMiddleware])
void main() {
  late HomeDatasourceImpl datasource;
  late MockHttpWithMiddleware client;

  setUp(
    () {
      client = MockHttpWithMiddleware();
      datasource = HomeDatasourceImpl(client: client);
    },
  );

  final tNewsSearch = NewsSearchModel.fromJson(json.decode(fixture("news_search.json")));

  test(
    'should return a News Search when the statusCode is equal to 200',
    () async {
      when(client.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response(
          fixture("news_search.json"),
          200,
          headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
        ),
      );

      final result = await datasource.getHeadlines();

      expect(result, equals(tNewsSearch));
    },
  );

  test(
    'should return a ServerException when statusCode is different than 200',
    () async {
      when(client.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response(
          "Something went wrong",
          404,
        ),
      );

      final result = datasource.getHeadlines();

      expect(() => result, throwsA(const TypeMatcher<ServerException>()));
    },
  );
}
