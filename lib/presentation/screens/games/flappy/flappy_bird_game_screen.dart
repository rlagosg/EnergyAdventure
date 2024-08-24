import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

    // Obtener maxScore del estado global
    final maxScore = context.read<GameCubit>().state.maxScore;
    game.updateMaxScore(maxScore);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!game.isGameOver){
          game.showPauseMenu();
        }else{
          context.replace('/');
        }
      },
      child: Stack(
        children: [
          GameWidget(
            game: game,
            overlayBuilderMap: {
              'pauseMenu': (BuildContext context, FlappyBirdGame game) {
                return PauseMenu(game: game);
              },
              'gameOver': (context, _) {
                context.read<GameCubit>().setContinue(false);
                game.isGameOver = true;
                return GameOverScreen(game: game, superContext: context);
              },
            },
            initialActiveOverlays: const [],
          ),
          BlocBuilder<GameCubit, GameState>(
            builder: (context, state) {
              return Visibility(
                visible: state.canContinue,
                child: PauseButton(
                  onPressed: () {
                    if (state.canContinue) {
                      game.showPauseMenu();
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}