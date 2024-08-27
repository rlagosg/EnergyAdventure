import 'package:energyadventure/config/router/app_router.dart';
import 'package:energyadventure/config/theme/app_theme.dart';
import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:energyadventure/presentation/providers/gamecubit/game_cubit_provider.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//integracion del provider para el gamecubit y manejo de data
Future<void> main() async {

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  
  //*configuracion de la rotacion de pantalla, por el momento solo vertical
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

//integracion del cubit
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameCubit = ref.watch(gameCubitProvider);

    return BlocProvider<GameCubit>(
      create: (_) => gameCubit,
      child: const MainApp(),
    );
  }
}


//configuraciones basicas de la app
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme( selectedColor:  0).getTheme(),
    );
  }
}