import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeButton extends StatelessWidget {

  final bool? replacement;

  const HomeButton({super.key, this.replacement = false });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return  TextButton(
      child: Image.asset( Assets.home, height: size.height * 0.07,),
      onPressed: () { replacement == true ? context.pushReplacement('/') : context.pop(); }          
    );
  }
}