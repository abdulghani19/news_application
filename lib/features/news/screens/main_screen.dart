import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_application/core/injection/injection.dart';

import 'package:news_application/features/news/bloc/news_bloc.dart';
import 'package:news_application/features/news/bloc/news_event.dart';
import 'package:news_application/features/news/screens/topics_screen.dart';

import 'home_screen.dart';
import 'search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),

    SearchScreen(),

    TopicsScreen(),

    Center(child: Text("Languages Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NewsBloc>()..add(const LoadTopHeadlines()),

      child: Scaffold(
        body: screens[currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,

          selectedItemColor: Colors.black,

          unselectedItemColor: Colors.grey,

          selectedLabelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 12),

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Topics",
            ),
          ],
        ),
      ),
    );
  }
}
