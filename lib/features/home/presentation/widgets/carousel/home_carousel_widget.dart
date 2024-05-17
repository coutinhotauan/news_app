import 'package:ds/ds.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/search_news/domain/entities/news_search.dart';

class HomeCarousel extends StatelessWidget {
  final NewsSearch headlines;
  final PageController controller = PageController();

  HomeCarousel({
    super.key,
    required this.headlines,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      width: MediaQuery.of(context).size.width,
      child: PageView(
        controller: controller,
        children: [
          HomeCarouselItem(
            article: headlines.articles![0],
          ),
          HomeCarouselItem(
            article: headlines.articles![1],
          ),
          HomeCarouselItem(
            article: headlines.articles![2],
          ),
        ],
      ),
    );
  }
}

class HomeCarouselItem extends StatelessWidget {
  final Articles article;
  final DSColors colors = const DSColors();

  const HomeCarouselItem({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(article.urlToImage ?? ''),
          fit: BoxFit.fill,
          opacity: 0.9,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              article.title ?? '',
              style: TextStyle(
                color: colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              article.description ?? '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
