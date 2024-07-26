import 'package:energyadventure/domain/entities/question.dart';

abstract class QuestionsRepository {
  Future<List<Question>> getQuestions();
}