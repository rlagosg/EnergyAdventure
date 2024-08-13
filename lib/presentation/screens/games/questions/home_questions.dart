import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';


class HomeQuestions extends StatelessWidget {
  
  static const name = 'home_questions';
  const HomeQuestions({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: FadeIn(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _MenuQuestionItem(height: size.height * 0.22, nameImage: 'tittle-gameofquestion.png',), 
                  _MenuQuestionItem(height: size.height * 0.28, nameImage: 'home-school.png',), 
                  SizedBox(height: size.height * 0.04),
                  _MenuQuestionItem(height: size.height * 0.28, nameImage: 'home-work.png',), 
                ]
              ),
              const HomeButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuQuestionItem extends StatelessWidget {
  final String nameImage;
  //final Size size;
  final double height;

  const _MenuQuestionItem({required this.height,
    required this.nameImage,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: TextButton(
        onPressed: () {
          // Acción al presionar el botón
        },
        child: Image.asset(
          'assets/images/games/questions/$nameImage',
           height: height,
        ),
      ),
    );
  }
}