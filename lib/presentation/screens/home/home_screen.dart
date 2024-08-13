import 'package:animate_do/animate_do.dart';
//import 'package:energyadventure/config/menu/menu_items.dart';
import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:energyadventure/presentation/widgets/ui/exit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView()
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}


class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();
    // Iniciando el manejo de la data
    context.read<GameCubit>().loadInitialData();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Center(
        child: FadeIn(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox( height: size.height * 0.03),
                  _MenuQuestionItem(height: size.height * 0.19, nameImage: 'menuLogo.png',), 
                  SizedBox( height: size.height * 0.03),
                  _MenuQuestionItem(height: size.height * 0.28, nameImage: 'wisdomBrigth.png', onPressed: () {
                    context.push('/home_questions');
                  },), 
                  SizedBox(height: size.height * 0.04),
                  _MenuQuestionItem(height: size.height * 0.28, nameImage: 'brilliantFlight.png', onPressed: ()=>{
                    context.push('/flappy_intro_screen')
                  }, ), 
                ]
              ),
              const ExitButton()
            ],
          ),
        ),
      );
  }
}


class _MenuQuestionItem extends StatelessWidget {
  final String nameImage;
  final double height;
  final VoidCallback? onPressed;
  
  const _MenuQuestionItem({
    required this.height,
    required this.nameImage,
    // ignore: unused_element
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: TextButton(
        onPressed: onPressed ?? () {}, // Asignamos una función vacía si onPressed es nulo
        child: FadeIn(
          child: Image.asset(
            'assets/images/menu/$nameImage',
            height: height,
          ),
        ),
      ),
    );
  }
}


// class _CustomListTittle extends StatelessWidget {
//   const _CustomListTittle({
//     required this.menuItem,
//   });

//   final MenuItem menuItem;

//   @override
//   Widget build(BuildContext context) {

//     final colors = Theme.of(context).colorScheme;

//     return ListTile(
//       leading: Icon( menuItem.icon, color: colors.primary, ),
//       trailing: Icon( Icons.arrow_forward_ios_outlined, color: colors.primary),
//       title: Text(menuItem.title),
//       subtitle: Text(menuItem.subTitle),
//       onTap: (){ 
//         context.push( menuItem.link );
//       },
//     );
//   }
// }