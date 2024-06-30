import 'package:get_it/get_it.dart';
import 'package:hava_durumu/repository/DatabaseRepository.dart';
import 'package:hava_durumu/service/sqflite/sqflite_database_service.dart';

GetIt locator = GetIt.instance;

setUpLocator(){
  locator.registerLazySingleton(() => DatabaseRepository());
  locator.registerLazySingleton(() => SqfliteDatabaseService());
}