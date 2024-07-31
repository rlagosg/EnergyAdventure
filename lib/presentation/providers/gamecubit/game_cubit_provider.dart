
import 'package:energyadventure/presentation/blocs/cubit/game_cubit.dart';
import 'package:energyadventure/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameCubitProvider = Provider<GameCubit>((ref) {
  final localStorageRepository = ref.watch(localStorageRespositoryProvider);
  final questionsRepository = ref.watch(questionRepositoryProvider);

  return GameCubit(questionsRepository, localStorageRepository);
});
