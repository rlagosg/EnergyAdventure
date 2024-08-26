import 'package:animate_do/animate_do.dart';
import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
 
class ModalQuestions extends StatelessWidget {
  const ModalQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final isEspecialHeight = size.height < 800;
    FlameAudio.play(Assets.soundGo);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: FadeIn(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Imagen de fondo
                Image.asset(
                  Assets.modalQuestions,
                  height: isTablet ? size.height * 0.70 : size.height * 1,
                ),
      
                // Botón de salir
                Positioned(
                  bottom: isEspecialHeight ? size.height * 0.175 : isTablet ? size.height * 0.022 : size.height * 0.169 ,
                  left: isEspecialHeight ? size.width * 0.26 : isTablet ? size.width * 0.25 : size.width * 0.28,
                  child: ElevatedButton(
                    onPressed: () {
                      FlameAudio.play(Assets.soundBack);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                    ),
                    child: Image.asset(
                      Assets.btnContinue,
                      width: isTablet ? size.height * 0.14 : size.height * 0.13,
                    ),
                  ),
                ),
              ],
            ),
          )
    );
  }
}