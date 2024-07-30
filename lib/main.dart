import 'package:energyadventure/config/router/app_router.dart';
import 'package:energyadventure/config/theme/app_theme.dart';
import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope( child: BlocProvider(
      create: ( _ ) => GameCubit(),
      child: const MainApp(),
    ) )
  );
}

/* 
  runApp(
    ProviderScope( child: BlocProvider(
      create: ( _ ) => GameCubit(),
      child: const MainApp(),
    ) )
  );

  runApp(
    const ProviderScope( child: MainApp() )
  );
 */

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
