import 'package:energyadventure/domain/entities/flappy_game/flappy_bird_game.dart';
import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';

import '../../../widgets/ui/ui.dart';


class FlappyScreen extends StatelessWidget {
  final FlappyBirdGame game;

  static const name = 'flappy_game_screen';
  static const String id = 'mainMenu';

  const FlappyScreen({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.menu),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            height: size.height * 0.25, // Ajusta el alto de la imagen
            child: Image.asset(
              Assets.play,
              fit: BoxFit.cover, // magen con su tamaño original
            ),
          ),
        ),
      ),
      ),
      floatingActionButton: const MyBackButton(),
    );
  }
}
