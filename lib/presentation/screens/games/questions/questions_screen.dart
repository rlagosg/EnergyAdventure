
import 'package:animate_do/animate_do.dart';
import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:energyadventure/presentation/blocs/cubit/games/game_questions_cubit.dart';
import 'package:energyadventure/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'question_view.dart';


class QuestionsScreen extends StatelessWidget {

  final String category;

  const QuestionsScreen({
    super.key, 
    required this.category
  });

  static const name = 'questions_screen';

  @override
  Widget build(BuildContext context) {  
    return BlocProvider(
      create: (_) => GameQuestionsCubit(),
      child:  _GameQuestionsView(category),
    );
  }
}

class _GameQuestionsView extends StatelessWidget {

  final String category;
  const _GameQuestionsView(this.category);

  @override
  Widget build(BuildContext context) {

    //llamamos la categoria seleccionada
    final questions = context.read<GameCubit>().getQuestionByCategory(category);
    //final cat = context.read<GameCubit>().state.currentCategory;
    context.watch<GameQuestionsCubit>().setQuestions(questions);

    return Scaffold(
      body: FadeIn(
        child: Stack(
          children: 
          [
            BlocBuilder<GameQuestionsCubit, GameQuestionsState>(
              builder: (context, state) {
                if (state.questions.isEmpty) {
                  return const Center(child: Text('No se encontraron preguntas'));
                } else {
                  final currentQuestion = state.questions[state.currentQuestionIndex];
                  return QuestionView(question: currentQuestion);
                }
              },
            ),
            const MyBackButton(),
          ]
        ),
      ),
    );
  }
}