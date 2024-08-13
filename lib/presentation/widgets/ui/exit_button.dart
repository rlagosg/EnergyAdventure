import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return  Positioned(
      bottom: 15,
      right: 15,
      child: TextButton(
        child: Image.asset( Assets.exit, height: size.height * 0.06,),
        onPressed: () { }
      ),          
    );
  }
}