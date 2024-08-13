import 'dart:math';

import 'package:energyadventure/presentation/components/flappy/pipe.dart';
import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

import '../../../domain/entities/entities.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  final _random = Random();
  late Bulb bulb;

  static const minSpacing = 100.0;

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final randomSpacing = 135 + _random.nextDouble() * (heightMinusGround / 4);
    final spacing = randomSpacing < minSpacing ? minSpacing : randomSpacing;
    
    final centerY = spacing + _random.nextDouble() * (heightMinusGround - spacing);

    bulb = Bulb()
      ..position = Vector2(20, centerY); // Ajustar la posición del bombillo según sea necesario

    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing / 2),
      Pipe(pipePosition: PipePosition.bottom, height: heightMinusGround - (centerY + spacing / 2)),
      bulb,
    ]);
  }

  void updateScoreAndBulb() {
    gameRef.bird.score += 1;
    bulb.toggle();
    FlameAudio.play(Assets.point);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (gameRef.bird.position.x > position.x && gameRef.bird.position.x < position.x + 10) {
      bulb.toggle();
    }

    if (position.x < -10) {
      removeFromParent();
      updateScoreAndBulb();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }
}