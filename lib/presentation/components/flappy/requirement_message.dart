import 'package:animate_do/animate_do.dart';
import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequirementMessage extends StatelessWidget {
  const RequirementMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final isEspecialHeight = size.height < 800; 

    // Ajustes de estilo en función del dispositivo
    final textStyle = TextStyle(
      fontSize: isTablet ? 35 : 25, 
      fontFamily: 'Comic', 
      color: const Color.fromARGB(255, 131, 115, 170),
    );

    FlameAudio.play(Assets.soundGo);

    Container myContainer(int counter, int streak) {
      return Container(
        //color: Colors.amber,
        width: isEspecialHeight ? size.width * 0.190 : isTablet ? size.width * 0.168 : size.width * 0.228,  
        height: isEspecialHeight ? size.height * 0.057 : isTablet ? size.height * 0.067 : size.height * 0.06,  
        alignment: Alignment.center, 
        child: Text('$counter/$streak', textAlign: TextAlign.center, style: textStyle),
      );
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      child: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          return FadeIn(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Imagen de fondo
                Image.asset(
                  Assets.requirementMessage,
                  height: isTablet ? size.height * 0.65 : size.height * 0.9,
                ),
      
                // Contador de rachas de school
                Positioned(
                  bottom: isEspecialHeight ? size.height * 0.312 : isTablet ? size.height * 0.145 : size.height * 0.310,
                  left: isTablet ? size.width * 0.185 : size.width * 0.168,
                  child: myContainer(state.schoolStreak, 2),
                ),
      
                // Contador de rachas de office
                Positioned(
                  bottom: isEspecialHeight ? size.height * 0.312 : isTablet ? size.height * 0.145 : size.height * 0.310,
                  right: isTablet ? size.width * 0.167 : size.width * 0.151,
                  child: myContainer(state.officeStreak, 1),
                ),
      
                // Botón de salir
                Positioned(
                  bottom: isTablet ? size.height * 0.05 : size.height * 0.22,
                  left: isTablet ? size.width * 0.41 : size.width * 0.45,
                  child: ElevatedButton(
                    onPressed: () {
                      FlameAudio.play(Assets.soundBack);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                    ),
                    child: Image.asset(
                      Assets.btnExit,
                      width: isTablet ? size.height * 0.17 : size.height * 0.13,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}