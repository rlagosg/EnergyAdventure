part of 'game_cubit.dart';

class GameState extends Equatable{
  final int id;
  final List<Question> questions;
  final int maxScore;
  final int currentScore;
  final int officeStreak;
  final int schoolStreak;
  final bool canContinue;
  final bool isIntroShown;
  final bool isIntroQuestionShown;
  final String currentCategory;
  final bool replacementHome;

  const GameState({
    this.id = 1,
    this.questions = const [],
    this.maxScore  = 0, 
    this.officeStreak = 0,
    this.schoolStreak = 0,
    this.currentScore = 0, 
    this.canContinue  = true,
    this.isIntroShown = false,    
    this.isIntroQuestionShown = false,    
    this.currentCategory = CategoryQuest.home,
    this.replacementHome = false,
  });

  copyWith({
    List<Question>? questions,
    int? maxScore,
    int? currentScore,
    int? schoolStreak,
    int? officeStreak,
    bool? canContinue,
    bool? isIntroShown,    
    bool? isIntroQuestionShown,    
    String? currentCategory,
    bool? replacementHome,
  }) => GameState(
      questions    : questions ?? this.questions,
      maxScore     : maxScore ?? this.maxScore,
      currentScore : currentScore ?? this.currentScore,
      officeStreak : officeStreak ?? this.officeStreak,
      schoolStreak : schoolStreak ?? this.schoolStreak,
      canContinue  : canContinue ?? this.canContinue,
      isIntroShown : isIntroShown ?? this.isIntroShown,      
      isIntroQuestionShown : isIntroQuestionShown ?? this.isIntroQuestionShown,      
      currentCategory : currentCategory ?? this.currentCategory,
      replacementHome : replacementHome ?? this.replacementHome,
  );

  @override
  List<Object> get props => [
    id,
    questions,
    maxScore,
    currentScore,
    officeStreak,
    schoolStreak,
    canContinue,
    isIntroShown,    
    isIntroQuestionShown,
    currentCategory,
    replacementHome,
  ];
}

