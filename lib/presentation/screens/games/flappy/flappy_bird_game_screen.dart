import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/entities.dart';
import '../../../components/flappy/pause_button.dart';
import '../../../components/flappy/pause_menu.dart';
import 'game_over_screen.dart';

class FlappyBirdGameScreen extends StatelessWidget {
  
  static const name = 'flappy_game_screen';
  const FlappyBirdGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = FlappyBirdGame();

    return Stack(
      children: [
        GameWidget(
          game: game,
          overlayBuilderMap: {
            'pauseMenu': (BuildContext context, FlappyBirdGame game) {
              return PauseMenu(game: game);
            },
            'gameOver': (context, _) => GameOverScreen(game: game),
          },
          initialActiveOverlays: const [],
        ),
        PauseButton(
          onPressed: () {
            game.showPauseMenu();
          },
        ),
      ],
    );
  }
}