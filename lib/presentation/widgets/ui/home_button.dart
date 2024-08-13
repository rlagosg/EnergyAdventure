import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return  Positioned(
      bottom: 35,
      right: 30,
      child: TextButton(
        child: Image.asset( Assets.home, height: size.height * 0.07,),
        onPressed: () { context.pop();}
      ),          
    );
  }
}