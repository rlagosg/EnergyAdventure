import 'package:flutter/material.dart';

class TapToPulbScreen extends StatelessWidget {
   
   static const name = 'tap_to_bulb_screen';
  const TapToPulbScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: Text('TapToPulbScreen'),
      ),
    );
  }
}