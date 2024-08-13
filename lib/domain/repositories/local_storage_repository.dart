

import '../entities/entities.dart';

abstract class LocalStorageRepository {

  Future<void> saveQuestions ( List<Question> questions );
  Future<List<Question>> getQuestions ();
  Future<GameData> getGameData ();

}