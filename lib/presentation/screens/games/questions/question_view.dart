import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:confetti/confetti.dart';
import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
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

    final cardCategory = context.read<GameCubit>().state.currentCategory == CategoryQuest.school ? Assets.cardQuestionShool : Assets.cardQuestionWork;

    void showCustomSnackbar(BuildContext context, bool isCorrect, String explanation) {


    TextStyle textTitle = TextStyle(
      fontSize: isTablet ? 26 : null, 
      color: const Color.fromARGB(255, 36, 18, 66),
      fontFamily: 'Comic',
    );

    TextStyle textExplanation = TextStyle(
      fontSize: isTablet ? 20 : null, 
      fontFamily: 'Comic',
    );

    // SnakBar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(isCorrect ? 'Correcto' : 'Incorrecto', style:textExplanation,),
      backgroundColor: isCorrect ? Colors.green : Colors.red,
      duration: const Duration(seconds: 1),
    ));

    // Modal
    Future.delayed(const Duration(seconds: 1), () {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(isCorrect ? '¡Bien Hecho!' : "Vamos a intentarlo de nuevo\n¡tú puedes!", style: textTitle),
          content: Text(isCorrect ? explanation : 'Recuerda... $explanation', style: textExplanation,),
          actions: [
            TextButton(
              onPressed: () { 
                Navigator.of(context).pop();
                if (isCorrect & isFinal){
                  context.pushReplacement('/congratulations');
                }
              },
              child: Text('Aceptar', style: textExplanation),
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
        left: isTablet ? size.width * 0.12 : size.width * 0.05,
        top: size.height * 0.15,
        child: Image.asset(cardCategory , width: isTablet ? size.width * 0.75 : size.width * 0.9, fit: BoxFit.cover,)
      ),

      // Imagen Personaje
      Positioned(
        left: isTablet ? size.width * 0.36 : size.width * 0.32,
        top:  isTablet ? size.height * 0.215:  size.height * 0.20,
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

      // imagen del box de pregunta
      Positioned(
        left: isTablet ? size.width * 0.16 : size.width * 0.10,
        top: isTablet ? size.height * 0.432 : size.height * 0.41,
        child: Image.asset(Assets.cardBoxQuestion_1, width:  isTablet ? size.width * 0.67 : size.width * 0.8, fit: BoxFit.cover,)
      ),

      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // Espacio inicial
          SizedBox(height: isTablet ? size.height * 0.385 : size.height * 0.322 ),     

          // Pregunta
          Padding(
            padding: EdgeInsets.only(left: isTablet ? size.width * 0.195 : size.width * 0.142, right: isTablet ? size.width * 0.210 : 40, ),
            child: FadeIn(
              child: Container(
                //color: Colors.amber,
                height: isTablet ? size.height * 0.18 : size.height * 0.175,
                width: isTablet ? size.width * 0.60 : size.width * 0.72,  
                alignment: Alignment.centerRight, 
                child: Text(
                  widget.question.content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isTablet ? 22 : 19.5, 
                    fontWeight: FontWeight.bold, 
                    fontFamily: 'Comic',
                    color: const Color.fromARGB(255, 59, 31, 108)
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