import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cubit/games/game_questions_cubit.dart';


class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; 

    return Stack(
      children: [
        Positioned(
          top: isTablet ? size.height * 0.03 : size.height * 0.036,
          left: isTablet ? size.width * 0.10 : size.width * 0.049,
          child: Image.asset(Assets.tittleQuestions, width: isTablet ? size.width * 0.8 : size.width * 0.9,)
        ),

        Column(
          children: [
            SizedBox(height: isTablet ? 125 : 93),
            const ControlledProgresIndicator()
          ],
        ),
      ]
    );
  }
}

class ControlledProgresIndicator extends StatelessWidget {

  const ControlledProgresIndicator({super.key});

  @override
  Widget build(BuildContext context) {

    final progress = context.watch<GameQuestionsCubit>().calculateProgress();
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; 
    
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: isTablet ? size.width * 0.14 : 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: LinearProgressIndicator(value: progress,color: const Color.fromRGBO(255, 197, 36, 9), )
              ),
            ],
          ),
    );
  }
}