import 'package:energyadventure/domain/entities/question.dart';

abstract class QuestionDataSource {
  Future<List<Questions>> getQuestions();
}