import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/error/exception.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/features/home/data/datasource/home_datasource.dart';
import 'package:news_app/features/home/data/repository/home_repository_impl.dart';
import 'package:news_app/features/search_news/data/models/news_search_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'home_repository_impl_test.mocks.dart';

@GenerateMocks([HomeDatasource])
void main() {
  late MockHomeDatasource datasource;
  late HomeRepositoryImpl repository;

  setUp(
    () {
      datasource = MockHomeDatasource();
      repository = HomeRepositoryImpl(
        datasource: datasource,
      );
    },
  );

  final tNewsSearch = NewsSearchModel.fromJson(
    json.decode(
      fixture("news_search.json"),
    ),
  );

  test(
    'should return data when the call to datasource is successful',
    () async {
      when(datasource.getHeadlines()).thenAnswer((_) async => tNewsSearch);

      final result = await repository.getHeadlines();

      expect(result, equals(Right(tNewsSearch)));
    },
  );

  test(
    'should return a ServerFailure when the call to datasource is unsuccessful',
    () async {
      when(datasource.getHeadlines()).thenThrow(ServerException());

      final result = await repository.getHeadlines();

      expect(result, equals(Left(ServerFailure())));
    },
  );
}
