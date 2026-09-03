import 'package:go_router/go_router.dart';

import 'package:news_application/features/news/screens/main_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',

  routes: [GoRoute(path: '/', builder: (context, state) => const MainScreen())],
);
