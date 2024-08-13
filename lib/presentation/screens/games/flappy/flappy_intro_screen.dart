
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../assets.dart';


class SlideFlappyTutorial {
  final String title;
  final String caption;
  final String imageUrl;

  SlideFlappyTutorial({required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideFlappyTutorial>[
  SlideFlappyTutorial(title: '¡Hey, amigo!', caption: '¡Hey, amigo! ¿Qué te parece si hacemos algo emocionante? ¡Prepárate para una aventura increíble!', imageUrl: Assets.flappySlide_1),
  SlideFlappyTutorial(title: '¡Listo!', caption: '¡Listo! Me he puesto mi super traje espacial. ¡Ahora estamos preparados para una gran misión!', imageUrl: Assets.flappySlide_2),
  SlideFlappyTutorial(title: '¡Vamos!', caption: '¡Vamos a volar alto y salvar energía! ¡Presiona el botón y comienza la aventura!', imageUrl: Assets.flappySlide_3),
];

class FlappyIntroScreen extends StatefulWidget {
   
  static const name = 'flappy_intro_screen';
  const FlappyIntroScreen({super.key});

  @override
  State<FlappyIntroScreen> createState() => _FlappyIntroScreenState();
}

class _FlappyIntroScreenState extends State<FlappyIntroScreen> {
  
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {   
    super.initState();
    pageViewController.addListener((){
      final page = pageViewController.page ?? 0;
      if(page >= slides.length - 1.5 && !endReached){
        endReached = true;
        //setState(() {}); //* seria ideal implementar un estado en cubit para manejar el estado del tutorial y agregar fadeins
      }
      setState(() {});
    }) ;
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: FadeIn(
        child: Stack(
          children: [
            PageView(
              controller: pageViewController,
            //physics: const BouncingScrollPhysics(),
              children: slides.map(
                (slideData) => SlideFlappy(slide: slideData)
                ).toList(),
            ),
        
            endReached ? 
            Positioned(
              right: size.width * 0.03,
              top:  size.height * 0.04,
              child: FadeInRight(
                from: 15,
                //delay:const Duration(seconds: 1),
                child: TextButton(
                  onPressed: () { context.push('/flappy_lobby_screen'); },
                  child: Image.asset( Assets.play, height: size.height * 0.06,),
                ),
              ),
            ) : const SizedBox(),
            endReached ? Positioned(
              left: size.width * 0.01,
              top: size.height * 0.11,
              child: FadeInLeft(
                from: 15,
                delay: const Duration(seconds: 1),
                child: TextButton(
                  onPressed: () {},
                  child: Image.asset( Assets.imReady, height: size.height * 0.06,),
                ),
              ),
            ): const SizedBox(),
            Positioned(
              bottom: 35,
              right: 30,
              child: TextButton(
                child: Image.asset( Assets.home, height: size.height * 0.07,),
                onPressed: () { context.pop();}
              ),          
            ),
             Positioned(
               bottom: 30,
               left: size.width * 0.35,
               child: Dots( totalSlides: slides.length, pageViewController: pageViewController, )
             )
        
          ],
        ),
      )
    );
  }
}

class SlideFlappy extends StatelessWidget {

  final SlideFlappyTutorial slide;
  const SlideFlappy({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(slide.imageUrl, fit: BoxFit.cover,),
          ]
      ),
    ));
  }
}

class Dots extends StatelessWidget {
  final int totalSlides;
  final PageController pageViewController;

  const Dots({
    super.key,
    required this.totalSlides,
    required this.pageViewController,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.height * 0.15,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalSlides,
          (i) => Dot(i, pageViewController: pageViewController),
        ),
      ),
    );
  }
}

class Dot extends StatefulWidget {
  final int index;
  final PageController pageViewController;

  const Dot(this.index, {super.key, required this.pageViewController});

  @override
  DotState createState() => DotState();
}

class DotState extends State<Dot> {
  @override
  Widget build(BuildContext context) {
    final page = widget.pageViewController.page ?? 0;
    double size;
    Color color;

    const Color primaryColor = Colors.blue;
    const Color secondaryColor = Colors.grey;
    const double primaryBulletSize = 12.0;
    const double secondaryBulletSize = 12.0;

    if (page >= widget.index - 0.5 && page < widget.index + 0.5) {
      size = primaryBulletSize;
      color = primaryColor;
    } else {
      size = secondaryBulletSize;
      color = secondaryColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}