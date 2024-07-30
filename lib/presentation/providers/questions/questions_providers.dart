
import 'package:energyadventure/domain/entities/question.dart';
import 'package:energyadventure/presentation/providers/questions/questions_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//https://cursos.devtalles.com/courses/take/flutter-movil-cero-a-experto/lessons/42922738-nowplaying-provider-y-notifier

final getQuestionsProvider = StateNotifierProvider<QuestionsNotifier, List<Question>>((ref) {

  final fetchQuestions = ref.watch( questionRepositoryProvider ).getQuestions;
  return QuestionsNotifier(
    fetchQuestionsCallback: fetchQuestions,
  );
});


typedef QuestionCallBack = Future<List<Question>> Function();

class QuestionsNotifier extends StateNotifier<List<Question>> {

  final QuestionCallBack fetchQuestionsCallback;

  QuestionsNotifier({
    required this.fetchQuestionsCallback,
  }) : super([]);

  Future<void> getQuestions() async {
      final questions = await fetchQuestionsCallback();
      state = questions;
  }

} 