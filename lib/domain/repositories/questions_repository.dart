

import '../entities/questions_game/question.dart';

abstract class QuestionsRepository {
  Future<List<Question>> getQuestions();
}