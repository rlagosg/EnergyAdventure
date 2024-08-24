
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String option;
  final VoidCallback onPressed;

  const AnswerButton({super.key, required this.option, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final isEspecialHeight = size.height < 800;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isEspecialHeight ? size.width * 0.01 : isTablet ? size.width * 0.02 : size.width * 0.02, horizontal: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all( isTablet ? size.width * 0.02 : size.width * 0.02),
          child: Text(option, style: TextStyle(fontFamily: 'Comic', fontSize: isTablet ? 22 : 16), textAlign: TextAlign.center, ),
        ),
      ),
    );
  }
}