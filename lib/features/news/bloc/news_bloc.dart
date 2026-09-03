import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_application/features/news/bloc/news_event.dart';
import 'package:news_application/features/news/bloc/news_state.dart';
import 'package:news_application/features/news/data/repositories/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;

  NewsBloc(this.repository) : super(const NewsInitial()) {
    on<LoadTopHeadlines>(_onLoadTopHeadlines);

    on<SearchNews>(_onSearchNews);

    on<LoadTopicNews>(_onLoadTopicNews);

    on<LoadLocalNews>(_onLoadLocalNews);

    on<LoadLanguages>(_onLoadLanguages);

    on<LoadMoreNews>(_onLoadMoreNews);
  }

  Future<void> _onLoadTopHeadlines(
    LoadTopHeadlines event,
    Emitter<NewsState> emit,
  ) async {
    try {
      emit(const NewsLoading());

      final articles = await repository.getTopHeadlines();

      emit(NewsLoaded(articles: articles));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  Future<void> _onSearchNews(SearchNews event, Emitter<NewsState> emit) async {
    try {
      emit(const NewsLoading());

      final articles = await repository.searchNews(event.query);

      emit(NewsLoaded(articles: articles));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  Future<void> _onLoadTopicNews(
    LoadTopicNews event,
    Emitter<NewsState> emit,
  ) async {
    try {
      emit(const NewsLoading());

      final articles = await repository.getTopicHeadlines(event.topic);

      emit(NewsLoaded(articles: articles));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  Future<void> _onLoadLocalNews(
    LoadLocalNews event,
    Emitter<NewsState> emit,
  ) async {
    try {
      emit(const NewsLoading());

      final articles = await repository.getLocalHeadlines(event.query);

      emit(NewsLoaded(articles: articles));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  Future<void> _onLoadLanguages(
    LoadLanguages event,
    Emitter<NewsState> emit,
  ) async {
    try {
      emit( NewsLoading());

      final languages = await repository.getLanguages();

      emit(const NewsLoaded(articles: []));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  Future<void> _onLoadMoreNews(
    LoadMoreNews event,
    Emitter<NewsState> emit,
  ) async {
    final currentState = state;

    if (currentState is NewsLoaded) {
      final currentCount = currentState.visibleCount;

      final totalArticles = currentState.articles.length;

      if (currentCount >= totalArticles) {
        return;
      }

      emit(
        NewsLoaded(
          articles: currentState.articles,

          visibleCount: currentCount + 10,

          isLoadingMore: false,
        ),

        
      );
    }
  }
}
