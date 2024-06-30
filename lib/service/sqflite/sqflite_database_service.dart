import 'package:hava_durumu/base/database_base.dart';
import 'package:hava_durumu/model/user.dart';
import 'package:hava_durumu/service/base/database_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteDatabaseService implements DatabaseService{
  Database? _database;
  String _tableName = "users";
  String _id = "id";
  String _username = "username";
  String _password = "password";

  Future<Database?> _getDatabase() async {
    if (_database == null) {
      String filePath = await getDatabasesPath();
      String databasePath = join(filePath, "users.db");
      _database = await openDatabase(
        databasePath,
        version: 1,
        onCreate: _tabloOlustur,
      );
    }
    return _database;
  }

  Future<void> _tabloOlustur(Database db, int versiyon) async {
    await db.execute("""
      CREATE TABLE $_tableName (
    $_id INTEGER PRIMARY KEY AUTOINCREMENT,
    $_username TEXT NOT NULL,
    $_password TEXT NOT NULL
);
      """);
  }


  @override
  Future insertUser(User user)async {
    Database? db = await _getDatabase();
    if (db != null) {
      return await db.insert(_tableName, user.toMap());
    } else {
      return -1;
    }
  }

  @override
  Future<List<User>> readUsers() async{
    Database? db = await _getDatabase();
    List<User> registered_users = [];
    if (db != null) {
      List<Map<String, dynamic>> usersMap = await db.query(_tableName);
      for (Map<String, dynamic> m in usersMap) {
        User u = User.fromMap(m);
        registered_users.add(u);
      }
    }
    return registered_users;
  }
}



