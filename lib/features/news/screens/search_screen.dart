import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_application/features/news/bloc/news_bloc.dart';
import 'package:news_application/features/news/bloc/news_event.dart';
import 'package:news_application/features/news/bloc/news_state.dart';
import 'package:news_application/features/news/widgets/news_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void search() {
    final query = _controller.text.trim();

    if (query.isNotEmpty) {
      context.read<NewsBloc>().add(SearchNews(query));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search News")),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),

            child: TextField(
              cursorColor: Colors.black87,
              controller: _controller,
              onSubmitted: (_) {
                search();
              },
              onChanged: (_) => setState(() {}), 
              style:  TextStyle(fontSize: 15, color: Colors.black87),
              decoration: InputDecoration(
                hintText: "Search news...",
                hintStyle: TextStyle(color: Colors.grey[500], fontSize: 15),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding:  EdgeInsets.symmetric(vertical: 14),

                prefixIcon: Icon(Icons.search, color: Colors.grey[500]),

                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.grey[500],
                          size: 20,
                        ),
                        onPressed: () {
                          _controller.clear();
                          setState(() {});
                        },
                      )
                    : IconButton(
                        icon:  Icon(
                          Icons.arrow_forward,
                          color: Colors.black87,
                        ),
                        onPressed: search,
                      ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:  BorderSide(
                    color: Colors.black87,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state is NewsError) {
                  return Center(child: Text(state.message));
                }

                if (state is NewsLoaded) {
                  if (state.articles.isEmpty) {
                    return Center(child: Text("No results found"));
                  }

                  return ListView.builder(
                    itemCount: state.articles.length,

                    itemBuilder: (context, index) {
                      return NewsCard(article: state.articles[index]);
                    },
                  );
                }

                return Center(child: Text("Search for news"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
