import 'package:animate_do/animate_do.dart';
import 'package:energyadventure/domain/entities/entities.dart';
import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/widgets.dart';


class HomeQuestions extends StatefulWidget {
  
  static const name = 'home_questions';  
  const HomeQuestions({super.key});

  @override
  State<HomeQuestions> createState() => _HomeQuestionsState();
}

class _HomeQuestionsState extends State<HomeQuestions> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {

      // Verificar si el modal de introducción debe ser mostrado
      if (!context.read<GameCubit>().state.isIntroQuestionShown) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const ModalQuestions();
          },
        );
        context.read<GameCubit>().setIntroQuestionShown(true);
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; 
    final replacement = context.watch<GameCubit>().state.replacementHome;

    return Scaffold(
      body: Center(
        child: FadeIn(
          child: Stack(
            children: [

              Positioned.fill(
                child: 
                  Image.asset( isTablet ? Assets.questionsBackgroundTablet : Assets.questionsBackground,
                    fit: BoxFit.cover, 
                  ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: isTablet ? 60 : 0 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _MenuQuestionItem(
                      height: size.height * 0.22, 
                      nameImage: 'tittle-gameofquestion.png',
                      onPressed: (){
                        showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const ModalQuestions();
                        },
                      );
                      },
                    ), 
                    _MenuQuestionItem(
                      height: size.height * 0.28, 
                      nameImage: 'home-school.png',
                      onPressed: () {
                        context.push('/questions/${CategoryQuest.school}'); 
                      },
                    ), 
                    SizedBox(height: size.height * 0.04),
                    _MenuQuestionItem(
                      height: size.height * 0.28, 
                      nameImage: 'home-work.png',
                      onPressed: () {
                        context.push('/questions/${CategoryQuest.office}');
                       },
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: HomeButton(replacement: replacement),
    );
  }
}

class _MenuQuestionItem extends StatelessWidget {
  final String nameImage;
  final double height;
  final VoidCallback? onPressed;

  const _MenuQuestionItem({
    required this.height,
    required this.nameImage,
    // ignore: unused_element
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: TextButton(
        onPressed: onPressed ?? () {},
        child: Image.asset(
          'assets/images/games/questions/$nameImage',
           height: height,
        ),
      ),
    );
  }
}