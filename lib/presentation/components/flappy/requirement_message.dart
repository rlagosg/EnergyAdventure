import 'package:animate_do/animate_do.dart';
import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequirementMessage extends StatelessWidget {
  const RequirementMessage({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    const TextStyle myTextStyle = TextStyle(
      fontSize: 25, 
      fontFamily: 'Comic', 
      color: Color.fromARGB(255, 131, 115, 170)
    );

    Container myContainer(int counter, int streak){
      return Container(
        width: size.width * 0.20,  
        height: size.height * 0.10,  
        alignment: Alignment.center, 
        child: Text('$counter/$streak' , textAlign: TextAlign.center, style: myTextStyle),
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
                  height: size.height * 0.50,
                ),
            
                // contador de rachas de home
                Positioned(
                  bottom: size.height * 0.087,
                  left: size.width * 0.164,
                  child: myContainer(state.schoolStreak, 2),
                ),
            
                // contador de rachas de office
                Positioned(
                  bottom: size.height * 0.087,
                  right: size.width * 0.147,
                  child: myContainer(state.officeStreak, 1) ,
                ),
            
                // Botón de salir
                Positioned(
                  top: size.height * 0.42,
                  left: size.width * 0.38,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                    ),
                    child: Image.asset(
                      Assets.btnExit,
                      width: size.height * 0.15, 
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      )
    );
  }
}