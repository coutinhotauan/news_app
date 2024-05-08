import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/error/exception.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';
import 'package:news_app/features/home/domain/usecases/get_headlines_usecase.dart';
import 'package:news_app/features/search_news/data/models/news_search_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'get_headlines_usecase_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late MockHomeRepository repository;
  late GetHeadlines usecase;

  setUp(
    () {
      repository = MockHomeRepository();
      usecase = GetHeadlines(
        repository: repository,
      );
    },
  );

  final tNewsSearch = NewsSearchModel.fromJson(
    json.decode(
      fixture("news_search.json"),
    ),
  );

  test(
    'should return data when the execution of usecase is successful',
    () async {
      when(repository.getHeadlines()).thenAnswer((_) async => Right(tNewsSearch));

      final result = await usecase.call(NoParams());

      expect(result, equals(Right(tNewsSearch)));
    },
  );

  test(
    'should return a ServerFailure when the execution of usecase is unsuccessful',
    () async {
      when(repository.getHeadlines()).thenAnswer((_) async => Left(ServerFailure()));

      final result = await usecase.call(NoParams());

      expect(result, equals(Left(ServerFailure())));
    },
  );
}
