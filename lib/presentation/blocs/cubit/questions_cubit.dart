
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial());

  void loadQuestions() {
    // Lógica para cargar preguntas desde Firebase
  }

  void answerQuestion(int questionId, int selectedOption) {
    // Lógica para manejar la respuesta
  }
  
}
