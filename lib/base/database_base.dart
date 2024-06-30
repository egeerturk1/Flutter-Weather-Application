import '../model/user.dart';

abstract class DatabaseBase{
  Future<dynamic> insertUser(User user);
  Future<List<User>> readUsers();
}