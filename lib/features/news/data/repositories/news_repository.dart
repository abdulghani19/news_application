import 'package:news_application/features/news/data/data_source/real_time_news_data_source.dart';
import 'package:news_application/features/news/data/model/article_model.dart';
import 'package:news_application/features/news/data/model/language_model.dart';
import 'package:news_application/features/news/data/model/story_coverage_model.dart';

class NewsRepository {
  final RealTimeNewsDataSource dataSource;

  NewsRepository(this.dataSource);

  Future<List<ArticleModel>> getTopHeadlines() async {
    return await dataSource.getTopHeadlines();
  }

  Future<List<ArticleModel>> searchNews(String query) async {
    return await dataSource.searchNews(query);
  }

  Future<List<ArticleModel>> getTopicHeadlines(String topic) async {
    return await dataSource.getTopicHeadlines(topic);
  }
  

  Future<List<ArticleModel>> getTopicNewsBySection(
    String topic,
    String section,
  ) async {
    return await dataSource.getTopicNewsBySection(topic, section);
  }

  Future<List<ArticleModel>> getLocalHeadlines(String query) async {
    return await dataSource.getLocalHeadlines(query);
  }

  Future<StoryCoverageModel> getFullStoryCoverage(String storyId) async {
    return await dataSource.getFullStoryCoverage(storyId);
  }

  Future<List<LanguageModel>> getLanguages() async {
    return await dataSource.getLanguages();
  }
}
