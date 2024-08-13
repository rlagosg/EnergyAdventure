
import '../entities/entities.dart';

abstract class LocalStorageDatasource {

  Future<void> saveQuestions ( List<Question> questions );
  Future<List<Question>> getQuestions ();
  Future<GameData> getGameData ();

}