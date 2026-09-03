import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_application/features/news/bloc/news_bloc.dart';
import 'package:news_application/features/news/bloc/news_state.dart';

import 'package:news_application/features/news/widgets/news_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Application')),
    
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return Center(child: CircularProgressIndicator());
          }
    
          if (state is NewsError) {
            return Center(child: Text(state.message));
          }
          if (state is NewsLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
    
              itemBuilder: (context, index) {
                final article = state.articles[index];
    
                return NewsCard(article: article);
              },
            );
          }
          return Center(child: Text('No News'));
        },
      ),
    );
  }
}
