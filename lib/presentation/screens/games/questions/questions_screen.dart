//import 'package:energyadventure/domain/entities/question.dart';
//import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:energyadventure/domain/entities/question.dart';
import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class QuestionsScreen extends StatelessWidget {

   static const name = 'questions_screen';
  const QuestionsScreen({super.key});

  void showCustomSnackbars( BuildContext context ){

    ScaffoldMessenger.of(context).clearSnackBars();
    
    const TextStyle style = TextStyle(color: Colors.white);

    const snakBack = SnackBar(
      //showCloseIcon: true,
      content:  Text('Correcto!!!!', style: style,),
      backgroundColor: Colors.orange,
      duration:  Duration(seconds: 1),
      //action: SnackBarAction(label: 'ok', onPressed: ()=>{}),
    );

    ScaffoldMessenger.of(context).showSnackBar( snakBack );

  }
  
  @override
  Widget build(BuildContext context) {

    //context.watch<GameCubit>().state.questions;
    //final List<Question> questions = context.watch<GameCubit>().state.questions; 

    return  Scaffold(

      body: const _QuestionsView(),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () =>  showCustomSnackbars(context), 
      ),
    );
  }
}

class _QuestionsView extends StatelessWidget {
  const _QuestionsView();

  @override
  Widget build(BuildContext context) {

    final List<Question> questions = context.watch<GameCubit>().state.questions;
    final q1 = questions[0];


    void showCustomSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();

  const TextStyle style = TextStyle(color: Colors.white);

  const snackBack = SnackBar(
    content: Text('Correcto!!!!', style: style),
    backgroundColor: Colors.orange,
    duration: Duration(seconds: 1),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBack);

  Future.delayed(snackBack.duration, () {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Recuerda..."),
         content: Text(q1.explication),
        actions: [
          FilledButton.tonal(
            onPressed: () => context.pop(),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  });
}

    return     
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: 
        [
          
          const Image( image: AssetImage( 'assets/images/1.png' ), height: 250,),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(q1.content),
          ),
          
          const Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children: []
            //  [
            //   ListView.builder(
            //   itemCount: q1.options.length,
            //   itemBuilder: (context, index){
            //     final option = q1.options[index];
            //     return  FilledButton.tonal(onPressed: () => showCustomSnackbar(context), child: Text(option));
            //   })
            // ]
          )
        ]
      );

   // );
  }
}