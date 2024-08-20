part of 'game_cubit.dart';

class GameState extends Equatable{
  final int id;
  final List<Question> questions;
  final int maxScore;
  final int currentScore;
  final bool canContinue;
  final bool isIntroShown;
  final String currentCategory;
  final bool replacementHome;

  const GameState({
    this.id = 1,
    this.questions = const [],
    this.maxScore = 0, 
    this.currentScore = 0, 
    this.canContinue = true,
    this.isIntroShown = false,    
    this.currentCategory = CategoryQuest.home,
    this.replacementHome = false,
  });

  copyWith({
    List<Question>? questions,
    int? maxScore,
    int? currentScore,
    bool? canContinue,
    bool? isIntroShown,    
    String? currentCategory,
    bool? replacementHome,
  }) => GameState(
      questions: questions ?? this.questions,
      maxScore: maxScore ?? this.maxScore,
      currentScore: currentScore ?? this.currentScore,
      canContinue: canContinue ?? this.canContinue,
      isIntroShown: isIntroShown ?? this.isIntroShown,      
      currentCategory: currentCategory ?? this.currentCategory,
      replacementHome: replacementHome ?? this.replacementHome,
  );

  @override
  List<Object> get props => [
    id,
    questions,
    maxScore,
    currentScore,
    canContinue,
    isIntroShown,    
    currentCategory,
    replacementHome,
  ];
}

