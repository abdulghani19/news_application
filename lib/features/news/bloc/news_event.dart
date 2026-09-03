import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object?> get props => [];
}

class LoadTopHeadlines extends NewsEvent {
  const LoadTopHeadlines();
}

class SearchNews extends NewsEvent {
  final String query;

  const SearchNews(this.query);

  @override
  List<Object?> get props => [query];
}

class LoadTopicNews extends NewsEvent {
  final String topic;

  const LoadTopicNews(this.topic);

  @override
  List<Object?> get props => [topic];
}

class LoadMoreNews extends NewsEvent {
  const LoadMoreNews();
}

class LoadLocalNews extends NewsEvent {
  final String query;

  const LoadLocalNews(this.query);

  @override
  List<Object?> get props => [query];
}

class LoadLanguages extends NewsEvent {
  const LoadLanguages();
}










































































































































































































