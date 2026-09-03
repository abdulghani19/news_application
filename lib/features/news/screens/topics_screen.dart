import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_application/features/news/bloc/news_bloc.dart';
import 'package:news_application/features/news/bloc/news_event.dart';
import 'package:news_application/features/news/bloc/news_state.dart';

import 'package:news_application/features/news/widgets/news_card.dart';

class TopicsScreen extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}
class _TopicsScreenState extends State<TopicsScreen> {
  int selectedIndex = -1;

  final List<String> topics =  [
    "WORLD",
    "BUSINESS",
    "TECHNOLOGY",
    "SPORTS",
    "SCIENCE",
    "HEALTH",
    "ENTERTAINMENT",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("Topics")),
      body: Column(
        children: [
          SizedBox(
            height: 60,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount: topics.length,

              itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.all(8),

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedIndex == index
                          ? Colors.black
                          : Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });

                      context.read<NewsBloc>().add(
                        LoadTopicNews(topics[index]),
                      );
                    },
                  

                    child: Text(
                      topics[index],

                      style: TextStyle(
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.black,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return  Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  );
                }
                if (state is NewsError) {
                  return Center(child: Text(state.message));
                }

                if (state is NewsLoaded) {
                  return ListView.builder(
                    itemCount: state.articles.length,

                    itemBuilder: (context, index) {
                      return NewsCard(article: state.articles[index]);
                    },
                  );
                }

                return  Center(child: Text("Choose a topic"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
