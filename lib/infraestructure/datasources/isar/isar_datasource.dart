
import 'package:energyadventure/domain/datasources/local_storage_datasource.dart';
import 'package:energyadventure/domain/entities/gamedata.dart';
import 'package:energyadventure/domain/entities/question.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

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

  @override
  Future<List<Question>> getQuestions() async {
    final isar = await db;
    return isar.questions.where().findAll();
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

      await isar.writeTxn(() async {
        isar.gameDatas.putSync(initialGameData);
      });

      return initialGameData;
    }
  }

}
