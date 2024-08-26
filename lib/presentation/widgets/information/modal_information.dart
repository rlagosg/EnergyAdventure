import 'package:animate_do/animate_do.dart';
import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

 
void modalInformation(BuildContext context) {
  final size = MediaQuery.of(context).size;
  FlameAudio.play(Assets.soundGo);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: FadeIn(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.information,
                  height: size.width * 0.88, // Ajusta el alto de la imagen
                  fit: BoxFit.contain, // Asegura que la imagen mantenga su proporción
                ),
              ],
            ),
            Positioned(
              left: size.width * 0.54,
              right: 0,
              child: TextButton(
                child: Icon(
                  Icons.close,
                  size: size.height * 0.04,
                  color: const Color.fromARGB(255, 60, 121, 151),
                ),
                onPressed: () {
                  FlameAudio.play(Assets.soundBack);
                  context.pop();
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
