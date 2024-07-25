import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [    
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/taptobulb',
      name: TapToPulbScreen.name,
      builder: (context, state) => const TapToPulbScreen(),
    ),
    GoRoute(
      path: '/questions',
      name: QuestionsScreen.name,
      builder: (context, state) => const QuestionsScreen(),
    ),
  ],
);