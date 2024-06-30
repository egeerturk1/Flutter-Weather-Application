import 'package:hava_durumu/base/database_base.dart';
import 'package:hava_durumu/model/user.dart';
import 'package:hava_durumu/service/base/database_service.dart';
import 'package:hava_durumu/service/sqflite/sqflite_database_service.dart';
import 'package:hava_durumu/tools/locator.dart';

class DatabaseRepository implements DatabaseBase{
  final DatabaseService _service = locator<SqfliteDatabaseService>();

  @override
  Future insertUser(User user)async {
    return await _service.insertUser(user);
  }

  @override
  Future<List<User>> readUsers()async {
    return await _service.readUsers();
  }
  
}