import 'package:dio/dio.dart';
import 'package:news_application/core/network/dio_client.dart';
import 'package:news_application/features/news/data/model/article_model.dart';
import 'package:news_application/features/news/data/model/language_model.dart';
import 'package:news_application/features/news/data/model/story_coverage_model.dart';

class RealTimeNewsDataSource {
  final Dio dio;
  

  RealTimeNewsDataSource(DioClient dioClient) : dio = dioClient.dio;

  Future<List<ArticleModel>> getTopHeadlines() async {
    final response = await dio.get(
      '/top-headlines',
      queryParameters: {'limit': 100, 'country': 'US', 'lang': 'en'},
    );

    final List articles = response.data['data'] ?? [];

    return articles
        .map<ArticleModel>((article) => ArticleModel.fromJson(article))
        .toList();
  }

  Future<List<ArticleModel>> searchNews(String query) async {
    final response = await dio.get(
      '/search',
      queryParameters: {
        'query': query,

        'limit': 100,

        'country': 'US',

        'lang': 'en',
      },
    );

    final List articles = response.data['data'] ?? [];

    return articles
        .map<ArticleModel>((article) => ArticleModel.fromJson(article))
        .toList();
  }

  Future<List<ArticleModel>> getTopicHeadlines(String topic) async {
    final response = await dio.get(
      '/topic-headlines',
      queryParameters: {
        'topic': topic,

        'limit': 100,

        'country': 'US',

        'lang': 'en',
      },
    );

    final List articles = response.data['data'] ?? [];

    return articles
        .map<ArticleModel>((article) => ArticleModel.fromJson(article))
        .toList();
  }

  Future<List<ArticleModel>> getTopicNewsBySection(
    String topic,
    String section,
  ) async {
    final response = await dio.get(
      '/topic-news-by-section',
      queryParameters: {
        'topic': topic,

        'section': section,

        'limit': 100,

        'country': 'US',

        'lang': 'en',
      },
    );

    final List articles = response.data['data'] ?? [];

    return articles
        .map<ArticleModel>((article) => ArticleModel.fromJson(article))
        .toList();
  }

  Future<List<ArticleModel>> getLocalHeadlines(String query) async {
    final response = await dio.get(
      '/local-headlines',
      queryParameters: {
        'query': query,

        'limit': 100,

        'country': 'US',

        'lang': 'en',
      },
    );

    final List articles = response.data['data'] ?? [];

    return articles
        .map<ArticleModel>((article) => ArticleModel.fromJson(article))
        .toList();
  }

  Future<StoryCoverageModel> getFullStoryCoverage(String storyId) async {
    final response = await dio.get(
      '/full-story-coverage',
      queryParameters: {
        'story': storyId,

        'sort': 'RELEVANCE',

        'country': 'US',

        'lang': 'en',
      },
    );

    return StoryCoverageModel.fromJson(response.data['data']);
  }

  Future<List<LanguageModel>> getLanguages() async {
    final response = await dio.get(
      '/language-list',
      queryParameters: {'country': 'US'},
    );

    final List languages = response.data['data'] ?? [];

    return languages
        .map<LanguageModel>((language) => LanguageModel.fromJson(language))
        .toList();
  }
}
