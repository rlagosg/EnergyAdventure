//import 'package:energyadventure/domain/entities/question.dart';
//import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
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
            return const Center(child: Text('No questions available'));
          } else {
            final currentQuestion = state.questions[state.currentQuestionIndex];
            return QuestionWidget(question: currentQuestion);
          }
        },
      ),
    );
  }
}


class QuestionWidget extends StatelessWidget {
  final Question question;

  const QuestionWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            question.content,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ...question.options.map((option) => AnswerButton(
              option: option,
              onPressed: () {
                final isCorrect = question.answer == question.options.indexOf(option);
                context.read<GameQuestionsCubit>().answerQuestion(isCorrect);
                showCustomSnackbar(context, isCorrect, question.explication);
                Future.delayed(const Duration(seconds: 2), () {
                  context.read<GameQuestionsCubit>().nextQuestion();
                });
              },
            )),
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