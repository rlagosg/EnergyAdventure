

import 'package:energyadventure/infraestructure/datasources/firebase/firebase_datasource.dart';
import 'package:energyadventure/infraestructure/repositories/questions_repository_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// este repositorio es de solo lectura
final questionRepositoryProvider = Provider((ref){

  // Proveedor de Firebase
  return QuestionsRepositoryImpl( FirebaseDatasource() );

  //* Si existiera otro proveedor
  //return QuestionsRespositoryImpl( OtherDatasource() );

});