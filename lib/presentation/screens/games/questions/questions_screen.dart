import 'package:energyadventure/domain/entities/question.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatelessWidget {

   static const name = 'questions_screen';
  const QuestionsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final List<Question> questions = [];//context.watch<GameCubit>().state.questions;

    return  Scaffold(
    body:ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return ListTile(
            title: Text(question.content, style: const TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(question.explication),            
          );
      },),
    );
  }
}