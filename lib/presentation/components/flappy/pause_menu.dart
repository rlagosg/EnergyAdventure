import 'package:energyadventure/domain/entities/entities.dart';
import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PauseMenu extends StatelessWidget {
  final FlappyBirdGame game;

  const PauseMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Center(
      child: Stack(
        children: [
          // Imagen de fondo del menú de pausa
          Positioned(
            child: Image.asset(
              Assets.menuPausa,
              height: size.height *0.22,
            ),
          ),

          // Botón de continuar
          Positioned(
            top: size.height * 0.05,
            left:size.width * 0.13,
            child: ElevatedButton(
              onPressed: () {
                game.hidePauseMenu();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Hacer el fondo del botón transparente
                shadowColor: Colors.transparent, // Eliminar la sombra
                padding: EdgeInsets.zero,
              ),
              child: Image.asset(
                Assets.btnContinue,
                width: size.height * 0.20, 
              ),
            ),
          ),
          
          // Botón de salir
          Positioned(
            top: size.height * 0.12,
            left:size.width * 0.13,
            child: ElevatedButton(
              onPressed: () {
                game.destroy(); // Destruye la instancia del juego
                context.replace('/'); // Regresar a la pantalla anterior
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Hacer el fondo del botón transparente
                shadowColor: Colors.transparent, // Eliminar la sombra
                padding: EdgeInsets.zero,
              ),
              child: Image.asset(
                Assets.btnExit,                
                width: size.height * 0.20, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}