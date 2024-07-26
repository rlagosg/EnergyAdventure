
import 'package:energyadventure/domain/datasources/questions_datasource.dart';
import 'package:energyadventure/domain/entities/question.dart';
import 'package:energyadventure/domain/repositories/questions_repository.dart';

class QuestionsRespositoryImpl extends QuestionsRepository {

  final QuestionsDataSource dataSource;
  QuestionsRespositoryImpl(this.dataSource);

  @override
  Future<List<Question>> getQuestions() {    
    return dataSource.getQuestions();
  }

}