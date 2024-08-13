import 'dart:async';

import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

import '../../../domain/entities/entities.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Background();

  @override
  Future<void> onLoad() async {
    if (sprite == null) {
      final background = await Flame.images.load(Assets.backgorund);
      sprite = Sprite(background);
    }
    size = gameRef.size;
  }
}
