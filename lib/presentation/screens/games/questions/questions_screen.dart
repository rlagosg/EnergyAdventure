
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:energyadventure/domain/entities/question.dart';
import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:energyadventure/presentation/blocs/cubit/games/game_questions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});
  static const name = 'questions_screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameQuestionsCubit(),
      child: const _GameQuestionsView(),
    );
  }
}

class _GameQuestionsView extends StatelessWidget {
  const _GameQuestionsView();

  @override
  Widget build(BuildContext context) {

    final questions = context.watch<GameCubit>().state.questions;
    context.watch<GameQuestionsCubit>().setQuestions(questions);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Game of Questions'),
      ),
      body: BlocBuilder<GameQuestionsCubit, GameQuestionsState>(
        builder: (context, state) {
          if (state.questions.isEmpty) {
            return const Center(child: Text('No se encontraron preguntas'));
          } else {
            final currentQuestion = state.questions[state.currentQuestionIndex];
            return QuestionWidget(question: currentQuestion);
          }
        },
      ),
    );
  }
}


class QuestionWidget extends StatefulWidget {
  final Question question;

  const QuestionWidget({super.key, required this.question});

  @override
  QuestionWidgetState createState() => QuestionWidgetState();
}

class QuestionWidgetState extends State<QuestionWidget> {
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
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
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
                height: 270,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                widget.question.content,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ...widget.question.options.map((option) => AnswerButton(
                  option: option,
                  onPressed: () {
                    final isCorrect = widget.question.answer == widget.question.options.indexOf(option);
                    context.read<GameQuestionsCubit>().answerQuestion(isCorrect);
                    showCustomSnackbar(context, isCorrect, widget.question.explication);
                    if (isCorrect) {
                      _showConfetti();
                    }
                    Future.delayed(const Duration(seconds: 2), () {
                      context.read<GameQuestionsCubit>().nextQuestion();
                      _changeImage();
                    });
                  },
                )),
          ],
        ),
        Align(
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
        ),
      ],
    );
  }

  void showCustomSnackbar(BuildContext context, bool isCorrect, String explanation) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(isCorrect ? 'Correcto' : 'Incorrecto'),
      backgroundColor: isCorrect ? Colors.green : Colors.red,
      duration: const Duration(seconds: 1),
    ));
    Future.delayed(const Duration(seconds: 1), () {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(isCorrect ? 'Bien Hecho' : 'Recuerda...'),
          content: Text(explanation),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
    });
  }
}

class AnswerButton extends StatelessWidget {
  final String option;
  final VoidCallback onPressed;

  const AnswerButton({super.key, required this.option, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(option),
      ),
    );
  }
}

/* 
  implementar el modo:
  - medallas y premios al final
  - esperar a marcar la correcta con boton de siguiente
  - crear mapa de categoria hogar / escuela &  hogar /trabajo
*/