

import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:confetti/confetti.dart';
import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CongratulationsScreen extends StatefulWidget {
  static const name = 'congratulations_screen';

  const CongratulationsScreen({super.key});

  @override
  CongratulationsScreenState createState() => CongratulationsScreenState();
}

class CongratulationsScreenState extends State<CongratulationsScreen> {
  final ConfettiController _confettiController1 = ConfettiController(duration: const Duration(seconds: 50));
  final ConfettiController _confettiController2 = ConfettiController(duration: const Duration(seconds: 50));
  final ConfettiController _confettiController3 = ConfettiController(duration: const Duration(seconds: 50));

  @override
  void initState() {
    super.initState();
    _confettiController1.play();
    _confettiController2.play();
    _confettiController3.play();

    Future.delayed(const Duration(seconds: 3), () {
      _showCongratulationsDialog();
    });
  }

  @override
  void dispose() {
    _confettiController1.dispose();
    _confettiController2.dispose();
    _confettiController3.dispose();
    super.dispose();
  }

  void _showCongratulationsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¡Felicitaciones!'),
          content: const Text(
            'Has completado todas las preguntas. ¡Buen trabajo!\n\n'
            'Recuerda que el ahorro de energía es fundamental para proteger nuestro planeta. '
            'Apaga las luces y dispositivos cuando no los estés usando y opta por electrodomésticos eficientes.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Volver al inicio'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
                context.go('/home_questions'); // Redirige a la pantalla de inicio usando GoRouter
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildConfetti(ConfettiController controller, double direction) {
    return ConfettiWidget(
      confettiController: controller,
      blastDirection: direction,
      emissionFrequency: 0.05,
      numberOfParticles: 20,
      shouldLoop: false,
      colors: const [
        Colors.green,
        Colors.blue,
        Colors.pink,
        Colors.orange,
        Colors.purple,
      ],
      gravity: 0.1,
    );
  }

  @override
  Widget build(BuildContext context) {

    //setiamos el replacemet del home
    context.read<GameCubit>().setReplacementHome(true);
    context.read<GameCubit>().updateStreak();

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FadeIn(
              child: Image.asset(
                'assets/images/games/questions/Celebration-2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildConfetti(_confettiController1, -pi / 2), // Desde abajo hacia arriba
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: _buildConfetti(_confettiController2, -3 * pi / 4), // Desde la esquina inferior izquierda
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: _buildConfetti(_confettiController3, -pi / 4), // Desde la esquina superior izquierda
            ),
          ),
        ],
      ),
    );
  }
}