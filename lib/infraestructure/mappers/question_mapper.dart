import 'package:energyadventure/domain/entities/question.dart';
import 'package:energyadventure/infraestructure/models/firebase/firebase_response.dart';

class QuestionMapper {

  /* Mapper para Firebase */
  static Question firebaseQuestion(FirebaseResponse question) => Question(
    answer: question.answer, 
    category: question.category, 
    content: question.content, 
    explication: question.explication, 
    id: question.id, 
    level: question.level, 
    options: question.options, 
    type: question.type
  );

}