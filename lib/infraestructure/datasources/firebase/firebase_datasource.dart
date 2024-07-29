
import 'package:dio/dio.dart';
import 'package:energyadventure/domain/datasources/questions_datasource.dart';
import 'package:energyadventure/domain/entities/question.dart';
import 'package:energyadventure/infraestructure/mappers/question_mapper.dart';
import 'package:energyadventure/infraestructure/models/firebase/firebase_response.dart';

class FirebaseDatasource extends QuestionsDataSource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://energy-adventure-glar-default-rtdb.firebaseio.com',
    queryParameters: {}
  ));

  @override
  Future<List<Question>> getQuestions() async {

    final response = await dio.get('/questions.json');
  
    final List<dynamic> data = response.data;
    
    final List<FirebaseResponse> firebaseResponses = data.map((entry) {
      return FirebaseResponse.fromJson(entry);
    }).toList();

    final List<Question> questions = firebaseResponses.map(
      (q) => QuestionMapper.firebaseQuestion(q)
    ).toList();

    return questions;
  }

}

