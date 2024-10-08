import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.deepPurple,
  Colors.blue,
  Colors.orange,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {

  final int selectedColor;
  final bool isDarckMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarckMode = false
  }): assert( selectedColor >= 0, 'Selected color must be greater then 0' ),  
      assert( selectedColor < colorList.length, 
        'Selected color must be less or equal than ${ colorList.length - 1 }');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarckMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[ selectedColor ],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );

  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkmode
  }) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarckMode: isDarkmode ?? isDarckMode,
  );

}