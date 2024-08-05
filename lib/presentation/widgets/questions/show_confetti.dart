
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ShowConfetti extends StatelessWidget {
  const ShowConfetti({
    super.key,
    required ConfettiController confettiController,
  }) : _confettiController = confettiController;

  final ConfettiController _confettiController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConfettiWidget(
        confettiController: _confettiController,
        blastDirectionality: BlastDirectionality.explosive,
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.pink,
          Colors.orange,
          Colors.purple
        ],
        shouldLoop: false,
      ),
    );
  }
}