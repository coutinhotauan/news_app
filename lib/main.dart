import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/search_news/presentation/bloc/news_search_cubit.dart';
import 'package:news_app/features/search_news/presentation/pages/news_page.dart';
import 'package:news_app/injector_container.dart';
import 'injector_container.dart' as di;

void main() {
  di.init();

  runApp(
    BlocProvider(
      create: (context) => sl<NewsSearchCubit>(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NewsPage());
  }
}
