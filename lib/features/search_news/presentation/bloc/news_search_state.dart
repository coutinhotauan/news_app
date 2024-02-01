import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/features/search_news/domain/entities/news_search.dart';

@immutable
abstract class NewsSearchState extends Equatable {}

class Empty extends NewsSearchState{
  @override
  List<Object?> get props => [];
}

class Loading extends NewsSearchState{
  @override
  List<Object?> get props => [];
}

class Loaded extends NewsSearchState{
  final NewsSearch news;

  Loaded({required this.news});

  @override
  List<Object?> get props => [news];
}

class Error extends NewsSearchState{
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [message];
}