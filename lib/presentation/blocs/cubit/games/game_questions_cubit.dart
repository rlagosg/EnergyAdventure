
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/entities.dart';

part 'game_questions_state.dart';

class GameQuestionsCubit extends Cubit<GameQuestionsState> {

  GameQuestionsCubit() : super(const GameQuestionsState());

  void setQuestions(List<Question> questions) {
    emit(state.copyWith(questions: questions));
  }

  void setContinue(bool canContinue) {
    emit(state.copyWith(canContinue: canContinue));
  }

  void updateScore(int score) {
    emit(state.copyWith(score: score));
  }

  void setCurrentQuestionIndex(int index) {
    emit(state.copyWith(currentQuestionIndex: index));
  }

  void answerQuestion(bool isCorrect) {
    final updatedScore = isCorrect ? state.score + 1 : state.score;
    emit(state.copyWith(
      isQuestionAnswered: true,
      isAnswerCorrect: isCorrect,
      score: updatedScore,
    ));
  }

  void nextQuestion() {
    if (state.currentQuestionIndex < state.questions.length - 1) {
      emit(state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex + 1,
        isQuestionAnswered: false,
        isAnswerCorrect: false,
      ));
    } else {
      // Handle end of questions scenario if needed
    }
  }

  void reset() {
    emit(state.copyWith(
      currentQuestionIndex: 0,
      score: 0,
      canContinue: true,
      isQuestionAnswered: false,
      isAnswerCorrect: false,
    ));
  }
}