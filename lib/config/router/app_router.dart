import 'package:energyadventure/domain/entities/entities.dart';
import 'package:energyadventure/presentation/screens/games/flappy/flappy_bird_game_screen.dart';
import 'package:energyadventure/presentation/screens/games/flappy/flappy_screen.dart';
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
      path: '/questions/:category',
      name: QuestionsScreen.name,
      builder: (context, state) 
      => QuestionsScreen(category: state.pathParameters['category'] ?? CategoryQuest.home),
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
    GoRoute(
      path: '/flappy_game_screen',
      name: FlappyBirdGameScreen.name,
      builder: (context, state) => const FlappyBirdGameScreen(),
    ),
    GoRoute(
      path: '/flappy_screen',
      name: FlappyScreen.name,
      builder: (context, state) => const FlappyScreen(),
    ),
  ],
);