import 'package:flutter/material.dart';
import 'package:hava_durumu/view/main_page.dart';
import 'package:hava_durumu/view_model/main_view_model.dart';
import 'package:hava_durumu/view_model/register_view_model.dart';
import 'package:provider/provider.dart';
import '../model/user.dart';
import '../repository/DatabaseRepository.dart';
import '../tools/locator.dart';
import '../view/register_page.dart';

class LoginViewModel with ChangeNotifier{

  DatabaseRepository _databaseRepository = locator<DatabaseRepository>();
  List<User> _userList = [];
  String _text = "";

  String get text => _text;

  set text(String value) {
    _text = value;
    notifyListeners();
  }

  Future<List<User>> getAllUsers()async{
    _userList = await _databaseRepository.readUsers();
    return _userList;
  }



  showAlertDialog2(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Uyarı"),
      content: Text("Lütfen Boşlukları Doldurunuz."),
      actions: [

        TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
            print("ok");
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void openRegisterPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(builder: (context){
     return ChangeNotifierProvider(
       create:(context) => RegisterViewModel(),
       child: RegisterPage(),
     );;
    }
    );
    Navigator.push(context, pageRoute);
  }

  void openMainPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(builder: (context){
      return ChangeNotifierProvider(
        create:(context) => MainViewModel(),
        child: MainPage(),
      );
    }
    );
    Navigator.push(context, pageRoute);
  }
}