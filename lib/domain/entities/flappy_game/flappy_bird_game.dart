import 'package:energyadventure/domain/entities/flappy_game/bird.dart';
import 'package:energyadventure/domain/entities/flappy_game/configuration.dart';
import 'package:energyadventure/presentation/components/flappy/background.dart';
import 'package:energyadventure/presentation/components/flappy/clouds.dart';
import 'package:energyadventure/presentation/components/flappy/ground.dart';
import 'package:energyadventure/presentation/components/flappy/pipe_group.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  
  FlappyBirdGame();

  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  bool isPaused = false;  // Agregar esta línea
  late TextComponent score;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    addAll([
      Background(),
      Ground(),
      Clouds(),
      bird = Bird(),
      score = buildScore(),
    ]);

    interval.onTick = () {
      if (!isPaused) {
        add(PipeGroup());
      }
    };
    interval.start();
  }

  TextComponent buildScore() {
    return TextComponent(
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center,
        textRenderer: TextPaint(
          style: const TextStyle(
              fontSize: 40, fontFamily: 'Game', fontWeight: FontWeight.bold, color: Colors.amberAccent,),
        ));
  }

  @override
  void onTap() {
    if (!isPaused) {
      bird.fly();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'BOMBILLOS: ${bird.score}';
  }

  // Métodos para pausar y reanudar el juego
  void pauseGame() {
    isPaused = true;
    pauseEngine(); // Pausa el motor del juego
  }

  void resumeGame() {
    isPaused = false;
    resumeEngine(); // Reanuda el motor del juego
  }
}
