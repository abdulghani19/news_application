import 'package:flutter/material.dart';

import 'package:news_application/core/injection/injection.dart';

import 'package:news_application/core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjection();

  runApp(const NewsApp());
}
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      title: 'News Application',

      routerConfig: appRouter,
    );
  }
}
