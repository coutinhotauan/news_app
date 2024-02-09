import 'package:flutter/material.dart';
import 'package:news_app/features/search_news/domain/entities/news_search.dart';
import 'package:news_app/features/search_news/presentation/widgets/search_news_item.dart';

// ignore: must_be_immutable
class SearchNewsList extends StatelessWidget {
  NewsSearch newsSearch;

  SearchNewsList({super.key, required this.newsSearch});

  @override
  Widget build(BuildContext context) {
    List<Articles>? news = newsSearch.articles;

    if (news != null) {
      return ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: index == news.length - 1 ? 0 : 10,
            ),
            child: SearchNewsItem(
              imageUrl: news[index].urlToImage,
              title: news[index].title,
              source: news[index].source?.name,
              author: news[index].author,
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
