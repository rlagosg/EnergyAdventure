import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/ui/ui.dart';


class FlappyScreen extends StatelessWidget {

  static const name = 'flappy_screen';
  static const String id = 'mainMenu';

  const FlappyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: 
        [
          GestureDetector(
          onTap: () { // Navega a la pantalla de juego FlappyBirdGameScreen
              context.push('/flappy_game_screen');
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
        )
        ]
      ),
      floatingActionButton: const MyBackButton(),
    );
  }
}
