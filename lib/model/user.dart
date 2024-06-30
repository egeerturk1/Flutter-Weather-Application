class User {
  int? id;
  String _username;
  String _password;

  String get username => _username;

  User(this._username, this._password);

  User.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        _username = map["username"],
        _password = map["password"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "username": _username,
      "password": _password,
    };
  }

  String get password => _password;
}
