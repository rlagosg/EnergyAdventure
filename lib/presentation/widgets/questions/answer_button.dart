
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String option;
  final VoidCallback onPressed;

  const AnswerButton({super.key, required this.option, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final isTabletPlus = size.width >= 800; 

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all( isTablet ? size.width * 0.02 : size.width * 0.02),
          child: Text(option, style: TextStyle(fontFamily: 'Comic', fontSize: isTabletPlus ? 28 : isTablet ? 17.5 : 16),),
        ),
      ),
    );
  }
}