import 'package:energyadventure/presentation/screens/games/questions/congratulations_screen.dart';
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
      path: '/questions',
      name: QuestionsScreen.name,
      builder: (context, state) => const QuestionsScreen(),
    ),
    GoRoute(
      path: '/congratulations',
      name: CongratulationsScreen.name,
      builder: (context, state) => const CongratulationsScreen(),
    ),
    GoRoute(
      path: '/home_questions',
      name: HomeQuestions.name,
      builder: (context, state) => const HomeQuestions(),
    ),
    GoRoute(
      path: '/flappy_intro_screen',
      name: FlappyIntroScreen.name,
      builder: (context, state) => const FlappyIntroScreen(),
    ),
    GoRoute(
      path: '/flappy_lobby_screen',
      name: FlappyLobbyScreen.name,
      builder: (context, state) => const FlappyLobbyScreen(),
    ),
  ],
);