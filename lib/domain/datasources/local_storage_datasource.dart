
import '../entities/entities.dart';

abstract class LocalStorageDatasource {

  Future<void> saveQuestions ( List<Question> questions );
  Future<List<Question>> getQuestions ();
  Future<void> saveGameData ( GameData gameData );
  Future<GameData> getGameData ();
  
}