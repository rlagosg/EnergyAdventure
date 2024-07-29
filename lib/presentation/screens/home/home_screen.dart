import 'package:energyadventure/config/menu/menu_items.dart';
import 'package:energyadventure/presentation/providers/questions/questions_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
   
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {    
    super.initState();
    ref.read(getQuestionsProvider.notifier).fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    
    final questions = ref.watch( getQuestionsProvider );
    //print(questions.length);
    //context.read<GameCubit>().setQuestions(questions);
    //final gameState = context.watch<GameCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Energy Adventure'),
      ),
      body:ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return ListTile(
            title: Text(question.content, style: const TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(question.explication),            
          );
      },),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {

    appMenuItems;

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