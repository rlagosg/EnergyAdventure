
import 'dart:convert';

import 'package:energyadventure/domain/datasources/local_storage_datasource.dart';
import 'package:energyadventure/infraestructure/mappers/question_mapper.dart';
import 'package:energyadventure/infraestructure/models/firebase/firebase_response.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../domain/entities/entities.dart';

class IsarDatasource extends LocalStorageDatasource{

  late Future<Isar> db;
  
  
  IsarDatasource(){
    db = openDB();
  }

  Future<Isar> openDB() async {

    final dir = await getApplicationDocumentsDirectory();

    if( Isar.instanceNames.isEmpty ){
      return await Isar.open(
        [QuestionSchema, GameDataSchema], 
        inspector: true,
        directory: dir.path, 
      );
    }

    return Future.value(Isar.getInstance());
  }


  // * Esta funcion tiene el proposito de traer preguntas provicionales
  // * se cargan desde el almacenamiento local desde un json
  Future<List<Question>> loadQuestionsFromAssets() async {

    final String response = await rootBundle.loadString('assets/data/provitional_questions.json');
    final Map<String, dynamic> data = jsonDecode(response);
    final List<dynamic> questionsData = data['questions'];
    
    final List<FirebaseResponse> assetsResponses = questionsData.map((entry) {
      return FirebaseResponse.fromJson(entry);
    }).toList();

    final List<Question> questions = assetsResponses.map(
      (q) => QuestionMapper.firebaseQuestion(q)
    ).toList();

    return questions;
  }

  @override
  Future<List<Question>> getQuestions() async {
    
    final isar = await db;     
    final questions = await isar.questions.where().findAll();

    // Si no hay preguntas en la base de datos
    if (questions.isEmpty) {
      final assestsQ = await loadQuestionsFromAssets();
      await saveQuestions(assestsQ);
      return assestsQ;
    }

    return questions;

  }


  @override
  Future<void> saveQuestions(List<Question> questions) async {
    final isar = await db;

    final List<int> list = (await isar.questions.where().findAll())
      .map((q) => q.isarId)
      .whereType<int>()
      .toList();

    if( list.isNotEmpty) {
      isar.writeTxnSync( () => isar.questions.deleteAllSync(list) );
    }
    
    isar.writeTxnSync( () => isar.questions.putAllSync(questions) );
  }


  @override
  Future<GameData> getGameData() async {
    
    final isar = await db;
    final gameData = await isar.gameDatas.where().findFirst();

    if (gameData != null) {
      return gameData;
    } else {
      
      final initialGameData = GameData(
        maxScore: 0, currentScore: 0,
        canContinue: false, isIntroShown: false,
      );

      await isar.writeTxnSync(() async {
        isar.gameDatas.putSync(initialGameData);
      });

      return initialGameData;
    }
  }

}
