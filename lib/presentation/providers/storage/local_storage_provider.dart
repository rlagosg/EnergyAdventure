

import 'package:energyadventure/infraestructure/datasources/isar/isar_datasource.dart';
import 'package:energyadventure/infraestructure/repositories/local_storage_respository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final localStorageRespositoryProvider = Provider((ref) {
  return LocalStorageRespositoryImpl( IsarDatasource() );

  //* Si existiera otro proveedor
  //return LocalStorageRespositoryImpl( OtherDatasource() );

});