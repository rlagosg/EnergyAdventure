
import 'package:energyadventure/domain/entities/gamedata.dart';
import 'package:energyadventure/domain/entities/question.dart';
import 'package:equatable/equatable.dart';
//import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {

  GameCubit() : super(
    const GameState(
      questions: [],
      maxScore: 0,
      currentScore: 0,
      canContinue: false,
      isIntroShown: false,
  ));

  void setQuestions(List<Question> question) {
    emit(state.copyWith(
      questions: question,
    ));
  }

  void setContinue( bool canContinue ){
    emit(state.copyWith(
      canContinue: canContinue,
    ));
  }

  void setIntroShow( bool isIntroShown ){
    emit(state.copyWith(
      isIntroShown: isIntroShown,
    ));
  }

  void maxScore ( int maxScore ) {
    emit(state.copyWith(
      maxScore: maxScore,
    ));
  }

  void setCurrentScore ( int currentScore ) {
    emit(state.copyWith(
      currentScore: currentScore,
    ));
  }

  void setState(GameData data, List<Question> questions) {
  emit(state.copyWith(
    questions: questions,
    maxScore: data.maxScore,
    currentScore: data.currentScore,
    canContinue: data.canContinue,
    isIntroShown: data.isIntroShown,
  ));
}
  
  //* Metodos y funciones que necesitemos a futuro


}
