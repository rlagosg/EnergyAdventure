import 'package:energyadventure/config/menu/menu_items.dart';
import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:energyadventure/presentation/providers/providers.dart';
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
    ref.read( getQuestionsProvider.notifier ).getQuestions();
  }

  @override
  Widget build(BuildContext context) {

    //obtengo las preuntas de firebase
    final questions = ref.watch( getQuestionsProvider );

    //guardo las preguntas en mi localStorage
    ref.watch( localStorageRespositoryProvider ).saveQuestions(questions);
    context.read<GameCubit>().setQuestions( questions);

    //guardo el estado en mi cubit
    //final gameData = ref.watch( localStorageRespositoryProvider ).getGameData();
    
    //context.read<GameCubit>().setState( gameData ,questions);

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTittle(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTittle extends StatelessWidget {
  const _CustomListTittle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon( menuItem.icon, color: colors.primary, ),
      trailing: Icon( Icons.arrow_forward_ios_outlined, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: (){ 
        context.push( menuItem.link );
      },
    );
  }
}