part of 'game_cubit.dart';

class GameState{
  final int id;
  final List<Question> questions;
  final int maxScore;
  final int currentScore;
  final bool canContinue;

  const GameState({
    this.id = 1,
    this.questions = const [],
    this.maxScore = 0, 
    this.currentScore = 0, 
    this.canContinue = false
  });

  copyWith({
    List<Question>? questions,
    int? maxScore,
    int? currentScore,
    bool? canContinue
  }) => GameState(
      questions: questions ?? this.questions,
      maxScore: maxScore ?? this.maxScore,
      currentScore: currentScore ?? this.currentScore,
      canContinue: canContinue ?? this.canContinue
  );

  //@override
  //List<Object> get props => [];
}

