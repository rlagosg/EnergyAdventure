import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return TextButton(
      child: Image.asset( Assets.exit, height: size.height * 0.07,),
      onPressed: () { SystemNavigator.pop(); }         
    );
  }
}