import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:confetti/confetti.dart';
import 'package:energyadventure/presentation/blocs/cubit/games/game_questions_cubit.dart';
import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/entities.dart';
import '../../../components/components.dart';
import '../../../widgets/widgets.dart';

class QuestionView extends StatefulWidget {
  final Question question;

  const QuestionView({super.key, required this.question});

  @override
  QuestionViewState createState() => QuestionViewState();
}

class QuestionViewState extends State<QuestionView> {
  int _currentImageIndex = 1;
  final Random _random = Random();
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 1));
    _changeImage();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _changeImage() {
    setState(() {
      _currentImageIndex = _random.nextInt(6) + 1;
    });
  }

  void _showConfetti() {
    _confettiController.play();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final isFinal = context.read<GameQuestionsCubit>().state.currentQuestionIndex == context.read<GameQuestionsCubit>().state.questions.length - 1;

    void showCustomSnackbar(BuildContext context, bool isCorrect, String explanation) {

    // SnakBar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(isCorrect ? 'Correcto' : 'Incorrecto'),
      backgroundColor: isCorrect ? Colors.green : Colors.red,
      duration: const Duration(seconds: 1),
    ));

    // Modal
    Future.delayed(const Duration(seconds: 1), () {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(isCorrect ? 'Bien Hecho' : "Vamos a intentarlo de nuevo\n¡tú puedes!"),
          content: Text(isCorrect ? explanation : 'Recuerda... $explanation'),
          actions: [
            TextButton(
              onPressed: () { 
                Navigator.of(context).pop();
                if (isCorrect & isFinal){
                  context.pushReplacement('/congratulations');
                }
              },
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
    });
    
  }

  return Stack(
    children: [
      const ProgressBar(),

      // imagen del card
      Positioned(
        left: size.width * 0.05,
        top: size.height * 0.15,
        child: Image.asset(Assets.cardQuestionShool, width: size.width * 0.9, fit: BoxFit.cover,)
      ),

      // Imagen Personaje
      Positioned(
        left: size.width * 0.28,
        top: size.height * 0.20,
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 2),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: Image.asset(
            'assets/images/$_currentImageIndex.png',
            key: ValueKey<int>(_currentImageIndex),
            height: size.height * 0.28,
          ),
        ),
      ),

      Positioned(
        left: size.width * 0.10,
        top: size.height * 0.41,
        child: Image.asset(Assets.cardBoxQuestion_1, width: size.width * 0.8, fit: BoxFit.cover,)
      ),

      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // Espacio inicial
          SizedBox(height: isTablet ? size.height * 0.05 : size.height * 0.32 ),     

          // Pregunta
          Padding(
            padding: EdgeInsets.only(left: isTablet ? size.width * 0.168 : size.width * 0.142, right: 40, ),
            child: FadeIn(
              child: Container(
                //color: Colors.amber,
                width: isTablet ? size.width * 0.168 : size.width * 0.72,  
                height: isTablet ? size.height * 0.067 : size.height * 0.20,
                alignment: Alignment.center, 
                child: Text(
                  widget.question.content,
                  style: const TextStyle(
                    fontSize: 19.5, 
                    fontWeight: FontWeight.bold, 
                    fontFamily: 'Comic',
                    color: Color.fromARGB(255, 59, 31, 108)
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: isTablet ? size.height * 0.05 : size.height * 0.04 ),

          // Respuestas
          ...widget.question.options.map((option) => AnswerButton(
            option: option,
            onPressed: () {
              final isCorrect = widget.question.answer == widget.question.options.indexOf(option);
              context.read<GameQuestionsCubit>().answerQuestion(isCorrect);
              showCustomSnackbar(context, isCorrect, widget.question.explication);
              if (isCorrect) {
                _showConfetti();
                Future.delayed(const Duration(seconds: 2), () {
                  if (!isFinal) {
                    context.read<GameQuestionsCubit>().nextQuestion();
                    _changeImage();
                  }
                });
              }
            },
          )),
        ],
      ),
      
      ShowConfetti(confettiController: _confettiController),
    ],
    );
  }
}