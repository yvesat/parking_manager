import 'package:go_router/go_router.dart';

import '../view/pages/home_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/home', builder: (context, state) => const HomePage(), routes: []),
  ],
);
