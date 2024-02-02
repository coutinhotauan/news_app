import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/search_news/data/models/news_search_model.dart';
import 'package:news_app/features/search_news/domain/entities/news_search.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tSourceModel = SourceModel(
    id: "engadget",
    name: "Engadget",
  );

  final ArticlesModel tArticlesModel = ArticlesModel(
    source: Source(
      id: "engadget",
      name: "Engadget",
    ),
    author: "Karissa Bell",
    title: "SEC approves bitcoin ETFs (for real this time)",
    description:
        "The Securities and Exchange Commission has approved\r\n the applications of 11 spot bitcoin ETFs in a highly anticipated decision that will make it much easier for people to dabble in cryptocurrency investing without directly buying and holding bitcoin. The app…",
    url:
        "https://www.engadget.com/sec-approves-bitcoin-etfs-for-real-this-time-224125584.html",
    urlToImage:
        "https://s.yimg.com/ny/api/res/1.2/n6iLNJ_9dtK.fT6WAXK1sA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD03OTU-/https://s.yimg.com/os/creatr-uploaded-images/2024-01/3edf5140-afdd-11ee-bf7c-7918e1b9d963",
    publishedAt: "2024-01-10T22:41:25Z",
    content:
        "The Securities and Exchange Commission has approved\r\n the applications of 11 spot bitcoin ETFs in a highly anticipated decision that will make it much easier for people to dabble in cryptocurrency in… [+1453 chars]",
  );

  final tNewsSearchModel = NewsSearchModel(
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
        description:
            "The Securities and Exchange Commission has approved\r\n the applications of 11 spot bitcoin ETFs in a highly anticipated decision that will make it much easier for people to dabble in cryptocurrency investing without directly buying and holding bitcoin. The app…",
        url:
            "https://www.engadget.com/sec-approves-bitcoin-etfs-for-real-this-time-224125584.html",
        urlToImage:
            "https://s.yimg.com/ny/api/res/1.2/n6iLNJ_9dtK.fT6WAXK1sA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD03OTU-/https://s.yimg.com/os/creatr-uploaded-images/2024-01/3edf5140-afdd-11ee-bf7c-7918e1b9d963",
        publishedAt: "2024-01-10T22:41:25Z",
        content:
            "The Securities and Exchange Commission has approved\r\n the applications of 11 spot bitcoin ETFs in a highly anticipated decision that will make it much easier for people to dabble in cryptocurrency in… [+1453 chars]",
      ),
      Articles(
        source: Source(
          id: "wired",
          name: "Wired",
        ),
        author: "Joel Khalili",
        title: "Why Crypto Idealogues Won’t Touch Bitcoin ETFs",
        description:
            "The arrival of spot bitcoin ETFs in the US offers easy access to the masses. Purists will steer clear.",
        url: "https://www.wired.com/story/bitcoin-etf-cryptocurrencies-split/",
        urlToImage:
            "https://media.wired.com/photos/65a0305c4aaf02fdf493f220/191:100/w_1280,c_limit/Not-Everyone-Is-Jazzed-About-Bitcoin-ETFs-Business-1299911534.jpg",
        publishedAt: "2024-01-11T18:18:13Z",
        content:
            "Bitcoin devotees are declaring a historic victory after US regulators approved a new, more accessible way for people to invest in the crypto asset after a decade of resistance. Yet they wont go anywh… [+3062 chars]",
      ),
    ],
  );

  group(
    'source model',
    () {
      test(
        'is a subclass of Source',
        () {
          expect(tSourceModel, isA<Source>());
        },
      );

      test(
        'should return a valid model',
        () {
          final Map<String, dynamic> jsonMap =
              json.decode(fixture("news_search.json"));

          final result = SourceModel.fromJson(jsonMap["articles"][0]["source"]);

          expect(result, tSourceModel);
        },
      );

      test(
        'should return a valid JSON map',
        () {
          final result = tSourceModel.toJson();

          final expectedMap = {
            "id": "engadget",
            "name": "Engadget",
          };

          expect(result, expectedMap);
        },
      );
    },
  );

  group(
    'articles model',
    () {
      test(
        'is a subclass of Articles',
        () {
          expect(tArticlesModel, isA<Articles>());
        },
      );

      test(
        'should return a valid model',
        () {
          final Map<String, dynamic> jsonMap =
              json.decode(fixture("news_search.json"));

          final result = ArticlesModel.fromJson(jsonMap["articles"][0]);

          expect(result, tArticlesModel);
        },
      );

      test(
        'should return a valid JSON map',
        () {
          final result = tArticlesModel.toJson();

          final expectedMap = {
            "source": {"id": "engadget", "name": "Engadget"},
            "author": "Karissa Bell",
            "title": "SEC approves bitcoin ETFs (for real this time)",
            "description":
                "The Securities and Exchange Commission has approved\r\n the applications of 11 spot bitcoin ETFs in a highly anticipated decision that will make it much easier for people to dabble in cryptocurrency investing without directly buying and holding bitcoin. The app…",
            "url":
                "https://www.engadget.com/sec-approves-bitcoin-etfs-for-real-this-time-224125584.html",
            "urlToImage":
                "https://s.yimg.com/ny/api/res/1.2/n6iLNJ_9dtK.fT6WAXK1sA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD03OTU-/https://s.yimg.com/os/creatr-uploaded-images/2024-01/3edf5140-afdd-11ee-bf7c-7918e1b9d963",
            "publishedAt": "2024-01-10T22:41:25Z",
            "content":
                "The Securities and Exchange Commission has approved\r\n the applications of 11 spot bitcoin ETFs in a highly anticipated decision that will make it much easier for people to dabble in cryptocurrency in… [+1453 chars]"
          };

          expect(result, expectedMap);
        },
      );
    },
  );

  group(
    'news search model',
    () {
      test(
        'is a subclass of news search',
        () {
          expect(tNewsSearchModel, isA<NewsSearch>());
        },
      );

      test(
        'should return a valid model',
        () {
          final Map<String, dynamic> jsonMap =
              json.decode(fixture("news_search.json"));

          final result = NewsSearchModel.fromJson(jsonMap);

          expect(result, tNewsSearchModel);
        },
      );

      test(
        'should return a valid JSON model',
        () {
          final result = tNewsSearchModel.toJson();

          final expectedMap = {
            "status": "ok",
            "totalResults": 13473,
            "articles": [
              {
                "source": {"id": "engadget", "name": "Engadget"},
                "author": "Karissa Bell",
                "title": "SEC approves bitcoin ETFs (for real this time)",
                "description":
                    "The Securities and Exchange Commission has approved\r\n the applications of 11 spot bitcoin ETFs in a highly anticipated decision that will make it much easier for people to dabble in cryptocurrency investing without directly buying and holding bitcoin. The app…",
                "url":
                    "https://www.engadget.com/sec-approves-bitcoin-etfs-for-real-this-time-224125584.html",
                "urlToImage":
                    "https://s.yimg.com/ny/api/res/1.2/n6iLNJ_9dtK.fT6WAXK1sA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD03OTU-/https://s.yimg.com/os/creatr-uploaded-images/2024-01/3edf5140-afdd-11ee-bf7c-7918e1b9d963",
                "publishedAt": "2024-01-10T22:41:25Z",
                "content":
                    "The Securities and Exchange Commission has approved\r\n the applications of 11 spot bitcoin ETFs in a highly anticipated decision that will make it much easier for people to dabble in cryptocurrency in… [+1453 chars]"
              },
              {
                "source": {"id": "wired", "name": "Wired"},
                "author": "Joel Khalili",
                "title": "Why Crypto Idealogues Won’t Touch Bitcoin ETFs",
                "description":
                    "The arrival of spot bitcoin ETFs in the US offers easy access to the masses. Purists will steer clear.",
                "url":
                    "https://www.wired.com/story/bitcoin-etf-cryptocurrencies-split/",
                "urlToImage":
                    "https://media.wired.com/photos/65a0305c4aaf02fdf493f220/191:100/w_1280,c_limit/Not-Everyone-Is-Jazzed-About-Bitcoin-ETFs-Business-1299911534.jpg",
                "publishedAt": "2024-01-11T18:18:13Z",
                "content":
                    "Bitcoin devotees are declaring a historic victory after US regulators approved a new, more accessible way for people to invest in the crypto asset after a decade of resistance. Yet they wont go anywh… [+3062 chars]"
              }
            ]
          };

          expect(result, expectedMap);
        },
      );
    },
  );
}
