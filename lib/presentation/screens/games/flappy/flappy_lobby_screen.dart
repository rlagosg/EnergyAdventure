import 'package:energyadventure/presentation/screens/games/flappy/game_over_screen.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/entities.dart';
import 'flappy_screen.dart';


class FlappyLobbyScreen extends StatelessWidget {
   
  static const name = 'flappy_lobby_screen';
  const FlappyLobbyScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final game = FlappyBirdGame();

    return GameWidget(
       game: game,
       initialActiveOverlays: const [FlappyScreen.id],
       overlayBuilderMap: {
         'mainMenu': (context, _) => FlappyScreen(game: game),
         'gameOver': (context, _) => GameOverScreen(game: game),
       },
     );
  }
}