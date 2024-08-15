

import 'dart:math';

import 'package:energyadventure/domain/repositories/local_storage_repository.dart';
import 'package:energyadventure/domain/repositories/questions_repository.dart';
import 'package:equatable/equatable.dart';
//import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';

part 'game_state.dart';



class GameCubit extends Cubit<GameState> {

  final QuestionsRepository questionsRepository;
  final LocalStorageRepository localStorageRepository;

  GameCubit(
    this.questionsRepository, 
    this.localStorageRepository) :
    super( const GameState());


  Future<void> loadInitialData() async {

    // Cargar primero las preguntas desde la memoria local
    final localQuestions = await localStorageRepository.getQuestions();
    emit(state.copyWith(questions: localQuestions));

    try {
      // Intente buscar preguntas en Firebase
      final questions = await questionsRepository.getQuestions();
      await localStorageRepository.saveQuestions(questions);
      emit(state.copyWith(questions: questions));
    } catch (e) {
      //print('no se pudo lograr la conexion en Firebase: $e');
    }

    // Cargar los datos del juego
    final game = await localStorageRepository.getGameData();
    emit(state.copyWith(
      maxScore: game.maxScore,
      currentScore: game.currentScore,
      canContinue: game.canContinue,
      isIntroShown: game.isIntroShown,

      replacementHome: false
    ));
    
  }

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

  void setCurrentCategory( String category){
    emit(state.copyWith(currentCategory: category));
  }  

  void setReplacementHome(bool replacement) {// Debugging
    emit(state.copyWith(replacementHome: replacement));
  } 
  
  List<Question> getQuestionByCategory(String category) {

    final categoryFilters = {
      CategoryQuest.office: [CategoryQuest.office, CategoryQuest.home],
      CategoryQuest.school: [CategoryQuest.school, CategoryQuest.home],
      CategoryQuest.climate: [CategoryQuest.climate, CategoryQuest.home],
    };

    final filters = categoryFilters[category];
    
    if (filters != null) {
      var questions = state.questions.where((question) => filters.contains(question.category)).toList();
      return filterQuestions(questions);
    } else {
      return state.questions.toList();
    }
  }

  List<Question> filterQuestions(List<Question> questions) {
    
    List<Question> selecteds = [];
    var random = Random();

    // Limita la cantidad de preguntas a seleccionar a la cantidad disponible
    int maxQuestions = questions.length < 10 ? questions.length : 10;

    while (selecteds.length < maxQuestions) {
      var number = random.nextInt(questions.length); // Genera un número entre 0 y questions.length - 1
      var question = questions[number];
      //print(number); // Esto es solo para depuración, puedes removerlo si no lo necesitas

      if (!selecteds.contains(question)) {
        selecteds.add(question);
      }
    }

    return selecteds;
  }

  //* Metodos y funciones que necesitemos a futuro

}
