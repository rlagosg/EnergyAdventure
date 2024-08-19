import 'package:energyadventure/domain/entities/flappy_game/bird_movement.dart';
import 'package:energyadventure/domain/entities/flappy_game/configuration.dart';
import 'package:energyadventure/domain/entities/flappy_game/flappy_bird_game.dart';
import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';


class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  Bird() : super(sprites: {});  // Inicializa sprites con un mapa vacío

  int score = 0;

  @override
  Future<void> onLoad() async {
    if (sprites != null && sprites!.isEmpty) {
      final birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
      final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
      final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);

      size = Vector2(50, 40);
      position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
      current = BirdMovement.middle;
      sprites = {
        BirdMovement.middle: birdMidFlap,
        BirdMovement.up: birdUpFlap,
        BirdMovement.down: birdDownFlap,
      };

      add(CircleHitbox());
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.birdVelocity * dt;
    if (position.y < 1) {
      gameOver();
    }
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, Config.gravity),
        EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = BirdMovement.down,
      ),
    );
    FlameAudio.play(Assets.flying);
    current = BirdMovement.up;
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }

  void gameOver() {
    FlameAudio.play(Assets.collision);
    game.isHit = true;
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();

    // Actualiza el estado del cubit para indicar que no se puede continuar
    //final gameCubit = context.read<GameCubit>();
    //gameCubit.setContinue(false);

  }
}
