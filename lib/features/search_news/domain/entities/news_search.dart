// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class NewsSearch extends Equatable {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsSearch({this.status, this.totalResults, this.articles});

  @override
  List<Object?> get props => [status, totalResults, articles];
}

class Articles extends Equatable {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  @override
  List<Object?> get props => [source, author, title, description, url, urlToImage, publishedAt, content];
}

class Source extends Equatable {
  String? id;
  String? name;

  Source({this.id, this.name});

  @override
  List<Object?> get props => [id, name];
}
