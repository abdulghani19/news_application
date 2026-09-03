import 'article_model.dart';


class StoryCoverageModel {

  final List<ArticleModel> topNews;
  final List<ArticleModel> allArticles;


  StoryCoverageModel({
    required this.topNews,
    required this.allArticles,
  });


  factory StoryCoverageModel.fromJson(
      Map<String, dynamic> json) {
    return StoryCoverageModel(

      topNews:
          (json['top_news'] ?? [])
              .map(
                (article) =>
                    ArticleModel.fromJson(
                      article,
                    ),
              )
              .toList()
              .cast<ArticleModel>(),


      allArticles:
          (json['all_articles'] ?? [])
              .map(
                (article) =>
                    ArticleModel.fromJson(
                      article,
                    ),
              )
              .toList()
              .cast<ArticleModel>(),

    );
  }
}