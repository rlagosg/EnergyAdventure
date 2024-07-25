import 'package:flutter/material.dart';

class MenuItem {

  final String title;
  final String subTitle;
  final String link;
  final IconData icon; 

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });

}

const appMenuItems = <MenuItem>[
  
  MenuItem(
    title: 'Apaga el Bombillo',
    subTitle: 'Juega a apagar el bombillo',
    link: '/taptobulb',
    icon: Icons.smart_button_outlined
  ),

  MenuItem(
    title: 'Completa',
    subTitle: 'Completa las preguntas y consejos',
    link: '/questions',
    icon: Icons.credit_card
  ),


];