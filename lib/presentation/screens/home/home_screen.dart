import 'package:animate_do/animate_do.dart';
//import 'package:energyadventure/config/menu/menu_items.dart';
import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:energyadventure/presentation/screens/games/assets.dart';
import 'package:energyadventure/presentation/widgets/widgets.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../components/components.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      floatingActionButton: ExitButton(),
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

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Cargar datos iniciales
      await context.read<GameCubit>().loadInitialData();

      // Verificar si el widget sigue montado
      if (!mounted) return;

      // Verificar si el modal de introducción debe ser mostrado
      if (!context.read<GameCubit>().state.isIntroShown) {
        modalInformation(context);
        context.read<GameCubit>().setIntroShow(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; 
    final canPlay = context.watch<GameCubit>().canPlayFlappy();
    
    void goAndPlay(String sound, String route) {
      FlameAudio.play(sound);
      context.push(route);
    }

    void showRequerimetModal() {
      //FlameAudio.play(Assets.soundGo);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const RequirementMessage();
        },
      );
    }
    
    return Center(
      child: FadeIn(
        child: Stack(
          children: [
            
            Positioned.fill(
            child: 
              Image.asset( isTablet ? Assets.homeBackgroundTablet : Assets.homeBackground,
                fit: BoxFit.cover, 
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: isTablet ? 90 : 0 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  SizedBox(height: size.height * 0.03),
                  _MenuQuestionItem(height: size.height * 0.19, nameImage: 'menuLogo.png', onPressed: (){
                    modalInformation(context);
                  }),
              
                  SizedBox(height: size.height * 0.03),
                  _MenuQuestionItem(height: size.height * 0.28, nameImage: 'wisdomBrigth.png', 
                  onPressed: () => goAndPlay(Assets.soundGo,'/home_questions')),
              
                  SizedBox(height: size.height * 0.04),
                  _MenuQuestionItem(height: size.height * 0.28, nameImage: 'brilliantFlight.png', 
                  onPressed: () {
                    if( canPlay ){
                      goAndPlay(Assets.soundGo, '/flappy_intro_screen');
                    }else{
                      showRequerimetModal();
                    }                  //
                  }),
                ],
              ),
            ),
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
