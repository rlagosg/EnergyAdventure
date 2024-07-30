

import 'package:energyadventure/domain/entities/gamedata.dart';
import 'package:energyadventure/domain/entities/question.dart';

abstract class LocalStorageRepository {

  Future<void> saveQuestions ( List<Question> questions );
  Future<List<Question>> getQuestions ();
  Future<GameData> getGameData ();

}