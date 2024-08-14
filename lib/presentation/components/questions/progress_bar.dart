import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cubit/games/game_questions_cubit.dart';


class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {

    //final size = MediaQuery.of(context).size;

    return const SizedBox(
      //top: size.height * 0.03,
      //left: size.width * 0.25,
      child: Column(
        children: [
          SizedBox(height: 50),
          Text('Preguntas Completadas', style: TextStyle(
            fontFamily: 'Comic', 
            fontSize: 20
          ),),
          SizedBox(height: 20),
          ControlledProgresIndicator()
        ],
      ),
    );
  }
}

class ControlledProgresIndicator extends StatelessWidget {

  const ControlledProgresIndicator({super.key});

  @override
  Widget build(BuildContext context) {

    final progress = context.watch<GameQuestionsCubit>().calculateProgress();
    
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: LinearProgressIndicator(value: progress )
              ),
            ],
          ),
    );
  }
}