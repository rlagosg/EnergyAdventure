import 'package:flutter/material.dart';

class QuestionsScreen extends StatelessWidget {

   static const name = 'questions_screen';
  const QuestionsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: Text('QuestionsScreen'),
      ),
    );
  }
}