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
    final isTabletPlus = size.width >= 800; 

    double scaleSizeHeight({double? tablePlus, double? tablet, double base = 1}) {
      return tablePlus != null && isTabletPlus ? size.height * tablePlus :
            tablet != null && isTablet ? size.height * tablet :
            size.height * base;
    }

    double scaleSizeWidth({double? tablePlus, double? tablet, double base = 1}) {
      return tablePlus != null && isTabletPlus ? size.width * tablePlus :
            tablet != null && isTablet ? size.width * tablet :
            size.width * base;
    }

    return Stack(
      children: [
        Positioned(
          top: scaleSizeHeight( tablet: 0.03, base: 0.036 ),
          left: scaleSizeWidth( tablet: 0.10, base: 0.049 ),
          child: Image.asset(Assets.tittleQuestions, width: scaleSizeWidth(tablet: 0.8, base:  0.9))
        ),

        Column(
          children: [
            SizedBox(height: scaleSizeHeight(tablet: 0.098, base: 0.095 )),
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
          padding: EdgeInsets.symmetric(horizontal: isTablet ? size.width * 0.17 : size.width * 0.13),
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