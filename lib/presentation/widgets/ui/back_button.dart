import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return  Positioned(
      bottom: 15,
      right: 15,
      child: TextButton(
        child: Image.asset( Assets.back, height: size.height * 0.06,),
        onPressed: () { context.pop(); }
      ),          
    );
  }
}