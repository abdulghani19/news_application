import 'package:equatable/equatable.dart';
import 'package:news_application/features/news/data/model/article_model.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {
  const NewsInitial();
}

class NewsLoading extends NewsState {
  const NewsLoading();
}

class NewsError extends NewsState {
  final String message;

  const NewsError(this.message);

  @override
  List<Object?> get props => [message];
}

class NewsLoaded extends NewsState {
  final List<ArticleModel> articles;

  final int visibleCount;

  final bool isLoadingMore;

  const NewsLoaded({
    required this.articles,

    this.visibleCount = 10,

    this.isLoadingMore = false,
  });

  @override
  List<Object?> get props => [articles, visibleCount, isLoadingMore];
}
