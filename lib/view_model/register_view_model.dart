import 'package:flutter/material.dart';

import '../model/user.dart';
import '../repository/DatabaseRepository.dart';
import '../tools/locator.dart';

class RegisterViewModel with ChangeNotifier{


  DatabaseRepository _databaseRepository = locator<DatabaseRepository>();

  void addUser(String text1,String text2,BuildContext context)async {
    if(text1.isNotEmpty && text2.isNotEmpty){
      User user = User(text1, text2);
      int userId = await _databaseRepository.insertUser(user);
    }else{
      showAlertDialog(context);
    }
  }


  showAlertDialog(BuildContext context) {
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
}