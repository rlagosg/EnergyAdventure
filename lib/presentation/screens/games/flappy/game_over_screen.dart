import 'package:energyadventure/domain/entities/flappy_game/flappy_bird_game.dart';
import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;

  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
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
                           
              SizedBox(height: size.height * 0.05),
              ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                child: const Text(
                  'Reiniciar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: (){ context.replace('/'); },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text(
                  'Salir',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      );}

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}
