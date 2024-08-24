import 'package:energyadventure/domain/entities/flappy_game/flappy_bird_game.dart';
import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;
  final BuildContext superContext;

  const GameOverScreen({super.key, required this.game, required this.superContext});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void changeCanContinue(bool canContinue) {
      context.read<GameCubit>().setContinue(canContinue);
    }

    // Comparar el puntaje actual con el maxScore y actualizar
    final currentScore = game.bird.score;
    final maxScore = context.read<GameCubit>().state.maxScore;

    if (currentScore > maxScore) {
      context.read<GameCubit>().maxScore(currentScore);
    }

    game.updateMaxScore(currentScore > maxScore ? currentScore : maxScore);

    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.gameOver, width: size.width * 0.80,),
            SizedBox(height: size.height * 0.07),
            Image.asset('assets/images/games/flappy/bulbOn.png', width: size.width * 0.09,),              
            SizedBox(height: size.height * 0.01),
            Text(
              'APAGASTE: ${game.bird.score}',
              style: const TextStyle(
                fontSize: 50,
                color: Colors.amberAccent,
                fontFamily: 'Game',
              ),
            ),
            //SizedBox(height: size.height * 0.01),
            Text(
              'RECORD: ${currentScore > maxScore ? currentScore : maxScore}',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.redAccent,
                fontFamily: 'Game',
              ),
            ),
            SizedBox(height: size.height * 0.05),
            TextButton(
              onPressed: () {
                onRestart();
                changeCanContinue(true); // Permite continuar después del reinicio
              },
              child: Image.asset(
                Assets.btnContinue,                
                width: size.height * 0.20, 
              ),
            ),
            TextButton(
              onPressed: (){ 
                changeCanContinue(true); // Permite continuar después de salir
                game.destroy(); // Destruye la instancia del juego
                superContext.replace('/');
              },
              child: Image.asset(
                Assets.btnExit,                
                width: size.height * 0.20, 
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.isGameOver = false;
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }

}
