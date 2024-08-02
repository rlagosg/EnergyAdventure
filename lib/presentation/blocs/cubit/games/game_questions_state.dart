part of 'game_questions_cubit.dart';

class GameQuestionsState extends Equatable {

  final int id;
  final List<Question> questions;
  final int currentQuestionIndex;
  final int score;
  final bool canContinue;
  final bool isQuestionAnswered;
  final bool isAnswerCorrect;
  
  const GameQuestionsState({
    this.id = 1, 
    this.questions = const [],
    this.currentQuestionIndex = 0,
    this.score = 0,
    this.canContinue = true,
    this.isQuestionAnswered = false,
    this.isAnswerCorrect = false,
  });

  copyWith({
    List<Question>? questions,
    int? maxScore,
    int? currentQuestionIndex,
    int? score,
    bool? canContinue,
    bool? isQuestionAnswered,
    bool? isAnswerCorrect,
  }) => GameQuestionsState(
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      score: score ?? this.score,
      canContinue: canContinue ?? this.canContinue,
      isQuestionAnswered: isQuestionAnswered ?? this.isQuestionAnswered,
      isAnswerCorrect: isAnswerCorrect ?? this.isAnswerCorrect,
  );

  @override
  List<Object> get props => [
    id,
    questions,
    currentQuestionIndex,
    score,
    canContinue,
    isQuestionAnswered,
    isAnswerCorrect
  ];
}

final class GameQuestionsInitial extends GameQuestionsState {}
