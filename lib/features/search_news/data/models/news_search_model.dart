import 'package:news_app/features/search_news/domain/entities/news_search.dart';

class NewsSearchModel extends NewsSearch {
  List<ArticlesModel>? articlesModel;

  NewsSearchModel({
    required String? status,
    required int? totalResults,
    required List<Articles>? articles,
  }) : super(
          status: status,
          totalResults: totalResults,
          articles: articles,
        ) {
    if (articles != null) {
      articlesModel = [];
      for (var article in articles) {
        articlesModel!.add(
          ArticlesModel(
            source: article.source,
            author: article.author,
            title: article.title,
            description: article.description,
            url: article.url,
            urlToImage: article.urlToImage,
            publishedAt: article.publishedAt,
            content: article.content,
          ),
        );
      }
    }
  }

  NewsSearchModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    totalResults = json["totalResults"];
    if (json["articles"] != null) {
      articles = <Articles>[];
      articlesModel = <ArticlesModel>[];
      if (json["articles"] is List) {
        json["articles"].forEach(
          (item) {
            articles!.add(
              Articles(
                source: item["source"] != null
                    ? Source(
                        id: item["source"]["id"],
                        name: item["source"]["name"],
                      )
                    : null,
                author: item["author"],
                title: item["title"],
                description: item["description"],
                url: item["url"],
                urlToImage: item["urlToImage"],
                publishedAt: item["publishedAt"],
                content: item["content"],
              ),
            );
            articlesModel!.add(
              ArticlesModel.fromJson(item),
            );
          },
        );
      }
    }
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>>? articlesData;

    if (articlesModel != null) {
      articlesData = [];
      for (var articles in articlesModel!) {
        articlesData.add(articles.toJson());
      }
    }

    final Map<String, dynamic> data = {
      "status": status,
      "totalResults": totalResults,
      "articles": articlesData,
    };

    return data;
  }
}

class ArticlesModel extends Articles {
  SourceModel? sourceModel;

  ArticlesModel({
    required Source? source,
    required String? author,
    required String? title,
    required String? description,
    required String? url,
    required String? urlToImage,
    required String? publishedAt,
    required String? content,
  }) : super(
          source: source,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        ) {
    sourceModel = SourceModel(
      id: source?.id,
      name: source?.name,
    );
  }

  ArticlesModel.fromJson(Map<String, dynamic> json) {
    if (json["source"] != null) {
      sourceModel = SourceModel.fromJson(json["source"]);
      source = Source(
        id: json["source"]["id"],
        name: json["source"]["name"],
      );
    }
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (sourceModel != null) {
      data["source"] = sourceModel!.toJson();
    }
    data["author"] = author;
    data["title"] = title;
    data["description"] = description;
    data["url"] = url;
    data["urlToImage"] = urlToImage;
    data["publishedAt"] = publishedAt;
    data["content"] = content;

    return data;
  }
}

class SourceModel extends Source {
  SourceModel({required String? id, required String? name})
      : super(id: id, name: name);

  SourceModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "id": id,
      "name": name,
    };

    return data;
  }
}
