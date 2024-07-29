import 'package:energyadventure/config/router/app_router.dart';
import 'package:energyadventure/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope( child: MainApp() )
  );
}

/* 
  runApp(
    ProviderScope( child: BlocProvider(
      create: ( _ ) => GameCubit(),
      child: const MainApp(),
    ) )
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
