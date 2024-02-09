import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/search_news/presentation/bloc/news_search_cubit.dart';
import 'package:news_app/features/search_news/presentation/bloc/news_search_state.dart';
import 'package:news_app/features/search_news/presentation/widgets/search_news_field.dart';
import 'package:news_app/features/search_news/presentation/widgets/search_news_list.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 8,
        ),
        child: Column(
          children: [
            SearchNewsField(
              onSearch: (String? keyword) {
                if (keyword != null && keyword != '') {
                  BlocProvider.of<NewsSearchCubit>(context).getNews(keyword);
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<NewsSearchCubit, NewsSearchState>(
              builder: (context, state) {
                switch (state) {
                  case Empty():
                    return Container();
                  case Loading():
                    return const CircularProgressIndicator();
                  case Loaded():
                    return Expanded(
                      child: SearchNewsList(newsSearch: state.news),
                    );
                  case Error():
                    return Center(
                      child: Text(
                        state.message
                      ),
                    );
                  default:
                    return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
