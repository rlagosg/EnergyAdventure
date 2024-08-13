
import '../entities/entities.dart';

abstract class QuestionsDataSource {
  Future<List<Question>> getQuestions();
}