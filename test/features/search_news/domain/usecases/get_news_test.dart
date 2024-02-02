import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/features/search_news/domain/entities/news_search.dart';
import 'package:news_app/features/search_news/domain/repository/news_search_repository.dart';
import 'package:news_app/features/search_news/domain/usecases/get_news_search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'get_news_test.mocks.dart';

@GenerateMocks([NewsSearchRepository])
void main() {
  late GetNewsSearch usecase;
  late MockNewsSearchRepository repository;

  setUp(
    () {
      repository = MockNewsSearchRepository();
      usecase = GetNewsSearch(repository: repository);
    },
  );

  const tKeyword = "keyword";
  final tNewsSearch = NewsSearch(
    status: "ok",
    totalResults: 13473,
    articles: [
      Articles(
        source: Source(
          id: "engadget",
          name: "Engadget",
        ),
        author: "Karissa Bell",
        title: "SEC approves bitcoin ETFs (for real this time)",
        description: "The Securities and Exchange Commission has approved\r\n the applications of 11 spot bitcoin ETFs in a highly anticipated decision that will make it much easier for people to dabble in cryptocurrency investing without directly buying and holding bitcoin. The app…",
        url: "https://www.engadget.com/sec-approves-bitcoin-etfs-for-real-this-time-224125584.html",
        urlToImage: "https://s.yimg.com/ny/api/res/1.2/n6iLNJ_9dtK.fT6WAXK1sA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD03OTU-/https://s.yimg.com/os/creatr-uploaded-images/2024-01/3edf5140-afdd-11ee-bf7c-7918e1b9d963",
        publishedAt: "2024-01-10T22:41:25Z",
        content: "The Securities and Exchange Commission has approved\r\n the applications of 11 spot bitcoin ETFs in a highly anticipated decision that will make it much easier for people to dabble in cryptocurrency in… [+1453 chars]",
      ),
    ],
  );

  test(
    'should get news from the repository',
    () async {
      when(repository.getNews(any)).thenAnswer((_) async => Right(tNewsSearch));

      final result = await usecase.call(Params(keyword: tKeyword));

      expect(result, Right(tNewsSearch));
      verify(repository.getNews(tKeyword));
      verifyNoMoreInteractions(repository);
    },
  );
}
