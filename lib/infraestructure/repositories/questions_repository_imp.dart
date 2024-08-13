
import 'package:energyadventure/domain/datasources/questions_datasource.dart';
import 'package:energyadventure/domain/repositories/questions_repository.dart';

import '../../domain/entities/entities.dart';

class QuestionsRepositoryImpl extends QuestionsRepository {

  final QuestionsDataSource dataSource;
  QuestionsRepositoryImpl(this.dataSource);

  @override
  Future<List<Question>> getQuestions() {    
    return dataSource.getQuestions();
  }

}