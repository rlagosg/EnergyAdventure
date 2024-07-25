//https://cursos.devtalles.com/courses/take/flutter-movil-cero-a-experto/lessons/42922318-entidad-repositories-y-datasources
//https://cursos.devtalles.com/courses/take/flutter-movil-cero-a-experto/lessons/42922389-datasource-obtener-peliculas-en-cines

import 'package:energyadventure/domain/entities/question.dart';

abstract class QuestionDataSource {
  Future<List<Questions>> getQuestions();
}