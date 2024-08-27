import 'package:flutter/material.dart';

import 'flappy_screen.dart';


class FlappyLobbyScreen extends StatelessWidget {
  static const name = 'flappy_lobby_screen';
  const FlappyLobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FlappyScreen(),
    );
  }
}
