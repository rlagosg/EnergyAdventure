
import 'package:energyadventure/domain/datasources/local_storage_datasource.dart';
import 'package:energyadventure/domain/repositories/local_storage_repository.dart';

import '../../domain/entities/entities.dart';



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
  
  @override
  Future<void> saveGameData(GameData gameData) {
    return datasource.saveGameData(gameData);
  }

}