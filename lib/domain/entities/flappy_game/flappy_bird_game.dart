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
  bool isPaused = false;
  bool isGameOver = false;
  late TextComponent score;

  late TextComponent record; 
  int maxScore = 0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    addAll([
      Background(),
      Ground(),
      Clouds(),
      bird = Bird(),
      score = buildScore(),
      record = buildRecord(),
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
          fontSize: 40,
          fontFamily: 'Game',
          fontWeight: FontWeight.bold,
          color: Colors.amberAccent,
        ),
      ),
    );
  }

  TextComponent buildRecord() {
    return TextComponent(
      position: Vector2(size.x / 2, size.y / 2 * 0.1),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 35,
          fontFamily: 'Game',
          fontWeight: FontWeight.bold,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  @override
  void onTap() {
     // Evita que el juego se reanude si el menú de pausa está activo
    if (isPaused && !overlays.isActive('pauseMenu')) {
      resumeGame();
    } else if (!isPaused) {
      bird.fly();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!isPaused) {
      interval.update(dt);
    }
    score.text = 'BOMBILLOS: ${bird.score}';
    record.text = 'RECORD: $maxScore';
  }

  void updateMaxScore(int newMaxScore) {
    maxScore = newMaxScore;
  }

  void pauseGame() {
    isPaused = true;
    pauseEngine();
  }

  void resumeGame() {
    isPaused = false;
    resumeEngine();
  }

  void showPauseMenu() {
    if (!isGameOver) {
      pauseGame();
      overlays.add('pauseMenu');
    }
  }

  void hidePauseMenu() {
    resumeGame();
    overlays.remove('pauseMenu');
  }

  void showGameOver() {
    isGameOver = true;
    overlays.add('gameOver');
    pauseEngine();
  }

  void destroy() {
    // Liberar recursos
    removeAll(children);
    overlays.clear();
    resumeEngine();
  }
}