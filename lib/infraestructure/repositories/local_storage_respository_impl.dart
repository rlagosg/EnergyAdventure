
import 'package:energyadventure/domain/datasources/local_storage_datasource.dart';
import 'package:energyadventure/domain/entities/gamedata.dart';
import 'package:energyadventure/domain/entities/question.dart';
import 'package:energyadventure/domain/repositories/local_storage_repository.dart';



class LocalStorageRespositoryImpl extends LocalStorageRepository {

  final LocalStorageDatasource datasource;

  LocalStorageRespositoryImpl( this.datasource );


  @override
  Future<List<Question>> getQuestions() {
    return datasource.getQuestions();
  }

  @override
  Future<void> saveQuestions(List<Question> questions) {
    return datasource.saveQuestions(questions);
  }
  
  @override
  Future<GameData> getGameData() {
    return datasource.getGameData();
  }

}