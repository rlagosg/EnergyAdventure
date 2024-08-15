import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyBackButton extends StatelessWidget {

  final String? replacement;

  const MyBackButton({super.key, this.replacement = ''});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return 
      TextButton(
        child: Image.asset( Assets.back, height: size.height * 0.07,),
        onPressed: () { replacement != '' ? context.replaceNamed(replacement ?? '/') : context.pop(); }          
    );
  }
}