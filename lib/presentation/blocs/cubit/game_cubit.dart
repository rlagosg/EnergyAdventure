
import 'package:energyadventure/domain/entities/question.dart';
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
  
  //* Metodos y funciones que necesitemos a futuro


}
