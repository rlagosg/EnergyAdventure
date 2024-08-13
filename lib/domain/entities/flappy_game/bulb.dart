

import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flame/components.dart';

import '../entities.dart';

class Bulb extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  bool isOn = true;

  @override
  Future<void> onLoad() async {
    await _updateSprite();
    size = Vector2(30, 50);
    anchor = Anchor.center;
  }

  Future<void> _updateSprite() async {
    final bulbImagePath = isOn ? Assets.bulbOn : Assets.bulbOff;
    if (sprite == null) {
      sprite = await gameRef.loadSprite(bulbImagePath);
    } else {
      sprite = await gameRef.loadSprite(bulbImagePath);
    }
  }

  void toggle() async {
    isOn = !isOn;
    await _updateSprite();
  }
}