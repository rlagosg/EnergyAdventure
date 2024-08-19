



import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';

class PauseButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PauseButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      top: 20,
      child: GestureDetector(
        onTap: onPressed,
        child: Image.asset(Assets.pause, width: 50, height: 50),
      ),
    );
  }
}