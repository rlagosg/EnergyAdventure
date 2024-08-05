

import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:energyadventure/presentation/blocs/cubit/games/game_questions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'question_view.dart';


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
            return QuestionView(question: currentQuestion);
          }
        },
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